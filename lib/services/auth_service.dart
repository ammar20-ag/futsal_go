import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth auth =
      FirebaseAuth.instance;

  final GoogleSignIn googleSignIn =
      GoogleSignIn();

  Future<User?> signInWithGoogle() async {

    final GoogleSignInAccount?
        googleUser =
        await googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication
        googleAuth =
        await googleUser.authentication;

    final credential =
        GoogleAuthProvider.credential(
      accessToken:
          googleAuth.accessToken,
      idToken:
          googleAuth.idToken,
    );

    final userCredential =
        await auth.signInWithCredential(
      credential,
    );

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      'isLogin',
      true,
    );

    await prefs.setString(
      'username',
      userCredential.user?.displayName ??
          '',
    );

    return userCredential.user;
  }

  Future<bool> isLogin() async {

    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool(
          'isLogin',
        ) ??
        false;
  }

  Future<String> getUsername() async {

    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getString(
          'username',
        ) ??
        '';
  }

  Future<void> logout() async {

    await googleSignIn.signOut();

    await auth.signOut();

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.clear();
  }
}