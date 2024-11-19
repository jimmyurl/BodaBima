import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_service.dart'; // Import your auth service
import 'l10n/localizations.dart'; // Import localization support

class ProfilePage extends StatefulWidget {
  final void Function(Locale) changeLanguage;
  final AppLocalizations localizations;
  final Locale selectedLocale;
  final SupabaseClient supabaseClient;

  const ProfilePage({
    Key? key,
    required this.changeLanguage,
    required this.localizations,
    required this.selectedLocale,
    required this.supabaseClient,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService(); // Instantiate AuthService

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Use the correct login method from AuthService
      await _authService.loginUser(
        _emailController.text,
        _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
      // You can add navigation here after successful login
    } catch (error) {
      setState(() {
        _errorMessage = 'Login failed: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.localizations.translate('profile') ?? 'Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              widget.changeLanguage(
                widget.selectedLocale.languageCode == 'en'
                    ? const Locale('sw', 'TZ')
                    : const Locale('en', 'US'),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: widget.localizations.translate('email') ?? 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText:
                    widget.localizations.translate('password') ?? 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _isLoading ? null : _handleSignIn,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Text(widget.localizations.translate('login') ?? 'Login'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Implement your toggle between sign up/login
              },
              child: Text(
                widget.localizations.translate('signup_instead') ??
                    'Sign Up Instead',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
