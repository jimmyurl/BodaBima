import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client;

  AuthService() : _client = Supabase.instance.client;

  // Registration Method
  Future<void> registerUser(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      throw 'Passwords do not match';
    }

    try {
      final response =
          await _client.auth.signUp(email: email, password: password);
      if (response.user != null) {
        print('Sign Up successful!');
      } else {
        throw 'Sign Up failed'; // Handle failure case
      }
    } catch (error) {
      print('Error registering user: $error');
      throw error; // Re-throw the error for further handling
    }
  }

  // Login Method
  Future<void> loginUser(String email, String password) async {
    try {
      final response = await _client.auth
          .signInWithPassword(email: email, password: password);
      if (response.user != null) {
        print('Login successful!');
      } else {
        throw 'Login failed. Please check your credentials.'; // Handle failure case
      }
    } catch (error) {
      print('Error logging in user: $error');
      throw error; // Re-throw the error for further handling
    }
  }
}
