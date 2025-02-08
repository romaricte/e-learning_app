import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning/core/config/supabase_config.dart';
import 'package:e_learning/core/error/exceptions.dart';

class AuthRepository {
  final SupabaseClient _client = SupabaseConfig.client;
  
  // Ajoutez cette variable pour gérer le rate limiting
  DateTime? _lastSignUpAttempt;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      if (_lastSignUpAttempt != null) {
        final difference = DateTime.now().difference(_lastSignUpAttempt!);
        if (difference.inSeconds < 60) {
          throw ServerException(
            message: 'Veuillez patienter une minute avant de réessayer'
          );
        }
      }
      _lastSignUpAttempt = DateTime.now();

      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName}
      );
      
      if (response.user != null) {
        try {
          // Attendre que la session soit établie
          await Future.delayed(const Duration(milliseconds: 500));
          
          // Utiliser la session courante pour l'insertion
          final session = await _client.auth.currentSession;
          if (session?.refreshToken != null) {
            await _client.auth.setSession(session!.refreshToken!);
          }
          
          await _client.from('profiles').insert({
            'id': response.user!.id,
            'full_name': fullName,
            'email': email,
            'created_at': DateTime.now().toIso8601String(),
          });
        } catch (e) {
          print('Erreur détaillée lors de la création du profil: $e');
          await _client.auth.admin.deleteUser(response.user!.id);
          throw ServerException(
            message: 'Erreur lors de la création du profil. Vérifiez la configuration de la base de données.'
          );
        }
      }
      
      return response;
    } on AuthException catch (e) {
      print('Erreur Supabase Auth: ${e.message}');
      if (e.message.contains('User already registered')) {
        throw ServerException(message: 'Cet email est déjà utilisé');
      }
      throw ServerException(message: 'Erreur d\'authentification: ${e.message}');
    } catch (e) {
      print('Erreur inattendue dans signUp: $e');
      if (e is ServerException) rethrow;
      throw ServerException(message: 'Une erreur inattendue est survenue');
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      await _client.auth.updateUser(
        UserAttributes(
          password: newPassword,
        ),
      );
    } catch (e) {
      throw ServerException();
    }
  }
} 