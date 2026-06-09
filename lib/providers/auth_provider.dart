import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? userName;
  String? email;

  void setUser(String name, String mail) {
    userName = name;
    email = mail;
    notifyListeners();
  }

  void logout() {
    userName = null;
    email = null;
    notifyListeners();
  }
}