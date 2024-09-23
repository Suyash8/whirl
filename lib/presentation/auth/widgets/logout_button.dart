import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';

class LogoutButton extends StatelessWidget {
  final Widget returnScreen;
  const LogoutButton({super.key, required this.returnScreen});

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => returnScreen));
      },
      text: 'Logout',
    );
  }
}
