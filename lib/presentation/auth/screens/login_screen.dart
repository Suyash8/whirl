import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/firebase_auth_error.dart';
import 'package:whirl/backend/auth/login.dart';
import 'package:whirl/backend/auth/validate_email.dart';
import 'package:whirl/backend/auth/validate_password.dart';
import 'package:whirl/core/theme/text_styles.dart';
import 'package:whirl/presentation/auth/screens/forgot_password_screen.dart';
import 'package:whirl/presentation/auth/screens/logged_in_screen.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return const LoggedInScreen();
    }
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(
                        'assets/avatars/24.png',
                      ),
                      width: 128.0,
                      height: 128.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Login",
                    style: TextStyles.display.small.copyWith(
                      fontWeight:
                          TextStyles.fontWeightTextStyles.labelMediumProminent,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    "Login to continue using the app",
                    style: TextStyles.body.medium
                        .copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 20.0),
                  const LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  int _loginButtonState = 0;

  int get loginButtonState => _loginButtonState;

  set loginButtonState(int value) {
    if (value < 0 || value > 3) {
      _loginButtonState = 0;
    } else {
      _loginButtonState = value;
    }
    setState(() {});
  }

  void changeLoginButtonState(int state) {
    setState(() {
      loginButtonState = state;
    });

    if (state != 0) {
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
            if (mounted) {
              changeLoginButtonState(2);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoggedInScreen(),
                ),
              );
            }
          }
          return value;
        });
      } catch (e) {
        // show error in app snack bar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(FirebaseAuthError.getErrorMessage(e)),
            ),
          );
          changeLoginButtonState(3);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: TextStyles.body.large.copyWith(
              fontWeight: TextStyles.fontWeightTextStyles.labelMediumProminent,
            ),
          ),
          const SizedBox(height: 8.0),
          InputField(
            controller: _emailController,
            hintText: 'Enter your email',
            validator: ValidateEmail().validate,
          ),
          const SizedBox(height: 16.0),
          Text(
            "Password",
            style: TextStyles.body.large.copyWith(
              fontWeight: TextStyles.fontWeightTextStyles.labelMediumProminent,
            ),
          ),
          const SizedBox(height: 8.0),
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
            hintText: 'Enter password',
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ForgotPasswordScreen();
                }));
              },
              child: Text(
                'Forgot password?',
                style: TextStyles.label.large.copyWith(
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
              ),
            ),
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
    );
  }
}
