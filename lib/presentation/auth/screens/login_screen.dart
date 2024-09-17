import 'package:flutter/material.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Input controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              controller: emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 16.0),
            InputField(
              controller: passwordController,
              obscureText: true,
              hintText: 'Password',
            ),
            const SizedBox(height: 16.0),
            AuthButton(
              onPressed: () {
                // Login logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
