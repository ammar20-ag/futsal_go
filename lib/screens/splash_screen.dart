import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  final AuthService authService =
      AuthService();

  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  Future<void> checkLogin() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final isLogin =
        await authService.isLogin();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            isLogin
                ? const MainNavigationScreen()
                : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Futsal Go",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}