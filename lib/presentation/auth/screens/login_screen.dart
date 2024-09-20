import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/login.dart';
import 'package:whirl/backend/auth/validate_email.dart';
import 'package:whirl/backend/auth/validate_password.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  UserCredential? userCredential;

  void printUserCredential() {
    if (userCredential != null) {
      print(userCredential!.user!.email);
      print(userCredential!.user!.uid);
      print(userCredential!.user!.displayName);
      print(userCredential!.user!.emailVerified);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                controller: _emailController,
                hintText: 'Email',
                validator: ValidateEmail().validate,
              ),
              const SizedBox(height: 16.0),
              InputField(
                controller: _passwordController,
                obscureText: !isPasswordVisible,
                validator: ValidatePassword().validate,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                hintText: 'Password',
              ),
              const SizedBox(height: 16.0),
              AuthButton(onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  userCredential = await Login().loginWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  printUserCredential();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
