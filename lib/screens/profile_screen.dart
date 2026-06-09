import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  String username = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    username =
        await AuthService().getUsername();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              username,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Status : Login",
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () async {

                await AuthService()
                    .logout();

                if (!mounted) return;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.logout,
              ),
              label: const Text(
                "Logout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}