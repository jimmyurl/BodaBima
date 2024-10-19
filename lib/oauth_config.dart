import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class AuthService {
  final SupabaseClient _client;

  AuthService() : _client = Supabase.instance.client;

  // Sign up method
  Future<void> signUp(String email, String password, String confirmPassword,
      BuildContext context) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.session != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign Up successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign Up failed.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing up: $error')),
      );
    }
  }

  // Sign in with email and password
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
        // Navigate to your desired page here
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Login failed. Please check your credentials.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error logging in: $error')),
      );
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final response = await _client.auth.signInWithOAuth(
        OAuthProvider.google,
      );

      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Google Sign-In initiated successfully!')),
        );
        // The actual sign-in result will be handled by Supabase's auth state change listener
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In initiation failed.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initiating Google Sign-In: $error')),
      );
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final response = await _client.auth.signInWithOAuth(
        OAuthProvider.facebook,
      );

      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Facebook Sign-In initiated successfully!')),
        );
        // The actual sign-in result will be handled by Supabase's auth state change listener
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Facebook Sign-In initiation failed.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initiating Facebook Sign-In: $error')),
      );
    }
  }
}
