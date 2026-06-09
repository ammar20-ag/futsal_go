import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final AuthService authService =
      AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
      ),
      body: Center(
  child: ElevatedButton.icon(
    onPressed: () async {

      final user =
          await AuthService()
              .signInWithGoogle();

      if (user == null) return;

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const MainNavigationScreen(),
        ),
      );
    },
    icon: const Icon(Icons.login),
    label: const Text(
      "Login Dengan Google",
    ),
  ),
),
    );
  }
}