import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning/core/config/supabase_config.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/services/auth_service.dart' as auth;

class AuthRepository {
  final SupabaseClient _client = SupabaseConfig.client;
  

  // Ajoutez cette variable pour gérer le rate limiting

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'phone_number': phoneNumber
        }
      );
      
      if (response.user == null) {
        throw ServerException(
          message: 'Erreur lors de la création du compte utilisateur'
        );
      }
      
      return response;
    } on auth.AuthException catch (e) {
      print('Erreur Supabase Auth: ${e.message}');
      if (e.message.contains('User already registered')) {
        throw auth.AuthException(
          message: 'Un compte existe déjà avec cette adresse email',
          code: 'email-already-exists'
        );
      } else if (e.message.contains('Invalid email')) {
        throw auth.AuthException(
          message: 'L\'adresse email n\'est pas valide',
          code: 'invalid-email'
        );
      } else if (e.message.contains('Password should be at least 6 characters')) {
        throw auth.AuthException(
          message: 'Le mot de passe doit contenir au moins 6 caractères',
          code: 'weak-password'
        );
      } else if (e.message.contains('rate limit')) {
        throw auth.AuthException(
          message: 'Trop de tentatives. Veuillez réessayer dans quelques minutes',
          code: 'too-many-requests'
        );
      }
      
      throw auth.AuthException(
        message: 'Erreur d\'authentification: ${e.message}',
        code: 'auth-error'
      );
    } catch (e) {
      print('Erreur inattendue dans signUp: $e');
      if (e is ServerException) rethrow;
      throw auth.AuthException(
        message: 'Une erreur inattendue est survenue lors de l\'inscription',
        code: 'unknown-error'
      );
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