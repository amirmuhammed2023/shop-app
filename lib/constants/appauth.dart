import 'package:firebase_auth/firebase_auth.dart';

class appauth {
  final auth = FirebaseAuth.instance;

  register(String email, String password) async {
    await auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  login(String email, String password) async {
    await auth.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  logout() async {
    await auth.signOut();
  }
}
