import 'package:firebase_auth/firebase_auth.dart';

class SendPasswordResetLink {
  Future<void> send(String email) async {
    try {
      return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}