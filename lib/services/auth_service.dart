import 'package:get/get.dart';
import 'package:e_learning/data/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning/core/config/supabase_config.dart';

class AuthException implements Exception {
  final String message;
  final String code;

  AuthException({required this.message, required this.code});

  @override
  String toString() => 'AuthException: $message (Code: $code)';
}

class AuthService extends GetxService {
  final AuthRepository _authRepository = AuthRepository();
  
  final Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _initializeAuthState();
  }

  void _initializeAuthState() {
    SupabaseConfig.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      
      switch (event) {
        case AuthChangeEvent.signedIn:
          _user.value = session?.user;
          break;
        case AuthChangeEvent.signedOut:
          _user.value = null;
          break;
        default:
          break;
      }
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      if (email.isEmpty || !GetUtils.isEmail(email)) {
        throw AuthException(
          message: 'Adresse email invalide',
          code: 'invalid-email'
        );
      }

      if (password.length < 6) {
        throw AuthException(
          message: 'Le mot de passe doit contenir au moins 6 caractères',
          code: 'weak-password'
        );
      }

      if (fullName.isEmpty) {
        throw AuthException(
          message: 'Le nom complet est requis',
          code: 'invalid-fullname'
        );
      }

      await _authRepository.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );
    } on AuthException {
      rethrow;
    } catch (e) {
      print('Erreur détaillée dans AuthService.signUp:');
      print('Type d\'erreur: ${e.runtimeType}');
      print('Message d\'erreur: $e');
      if (e is Error) {
        print('Stack trace: ${e.stackTrace}');
      }
      
      if (e.toString().contains('User already registered')) {
        throw AuthException(
          message: 'Cette adresse email est déjà utilisée',
          code: 'email-already-in-use'
        );
      } else if (e.toString().contains('ServerException')) {
        print('Détails de ServerException: $e');
        throw AuthException(
          message: 'Erreur de connexion au serveur. Veuillez réessayer.',
          code: 'server-error'
        );
      }
      
      throw AuthException(
        message: 'Une erreur inattendue est survenue lors de l\'inscription',
        code: 'unknown-error'
      );
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || !GetUtils.isEmail(email)) {
        throw AuthException(
          message: 'Adresse email invalide',
          code: 'invalid-email'
        );
      }

      if (password.isEmpty) {
        throw AuthException(
          message: 'Le mot de passe est requis',
          code: 'empty-password'
        );
      }

      await _authRepository.signIn(
        email: email,
        password: password,
      );
    } on AuthException {
      rethrow;
    } catch (e) {
      print('Erreur inattendue dans AuthService.signIn: $e');
      throw AuthException(
        message: 'Erreur lors de la connexion',
        code: 'auth-error'
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
    } catch (e) {
      print('Erreur lors de la déconnexion: $e');
      throw AuthException(
        message: 'Erreur lors de la déconnexion',
        code: 'signout-error'
      );
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      if (email.isEmpty || !GetUtils.isEmail(email)) {
        throw AuthException(
          message: 'Adresse email invalide',
          code: 'invalid-email'
        );
      }

      await _authRepository.resetPassword(email);
    } catch (e) {
      print('Erreur lors de la réinitialisation du mot de passe: $e');
      throw AuthException(
        message: 'Erreur lors de la réinitialisation du mot de passe',
        code: 'reset-password-error'
      );
    }
  }
} 