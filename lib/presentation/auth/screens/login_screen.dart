import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/firebase_auth_error.dart';
import 'package:whirl/backend/auth/login.dart';
import 'package:whirl/backend/auth/validate_email.dart';
import 'package:whirl/backend/auth/validate_password.dart';
import 'package:whirl/presentation/auth/screens/logged_in_screen.dart';
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
  int loginButtonState = 0;

  void changeLoginButtonState(int state) {
    if (state < 0 || state > 3) {
      state = 0;
    }

    setState(() {
      loginButtonState = state;
    });

    if (state != 1) {
      // after 1 second, reset the button state to 0
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            loginButtonState = 0;
          });
        }
      });
    }
  }

  void login(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      changeLoginButtonState(1);
      try {
        await Login()
            .loginWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          if (value != null) {
            changeLoginButtonState(2);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoggedInScreen(),
              ),
            );
          }
          return value;
        });
      } catch (e) {
        // show error in app snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(FirebaseAuthError.getErrorMessage(e)),
          ),
        );
        changeLoginButtonState(3);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return const LoggedInScreen();
    }
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
              AuthButton(
                text: 'Login',
                loadingText: 'Logging in...',
                state: loginButtonState,
                onPressed: () => login(
                  _emailController.text,
                  _passwordController.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
