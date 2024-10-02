import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/send_password_reset_link.dart';
import 'package:whirl/backend/auth/validate_email.dart';
import 'package:whirl/core/theme/text_styles.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              "Forgot Password",
              style: TextStyles.display.small.copyWith(
                fontWeight:
                    TextStyles.fontWeightTextStyles.labelMediumProminent,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              "Enter your email to reset your password",
              style: TextStyles.body.medium
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: 20.0),
            const ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _state = 0;

  int get state => _state;
  set state(int value) {
    if (value < 0 || value > 3) {
      _state = 0;
    } else {
      _state = value;
    }

    if (value != 0) {
      Future.delayed(const Duration(seconds: 1), () {
        _state = 0;
        if (mounted) {
          setState(() {});
        }
      });
    }

    setState(() {});
  }

  void sendResetLink() {
    if (formKey.currentState!.validate()) {
      state = 1;
      try {
        SendPasswordResetLink().send(emailController.text);
        state = 2;
        if (mounted) {
          setState(() {});

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Reset link sent successfully."),
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primaryFixed,
            ),
          );
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            }
          });
        }
      } catch (e) {
        state = 3;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Unable to send reset link. Please try again."),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,

              hintText: 'Email',

            validator: (value) => ValidateEmail().validate(value),
          ),
          const SizedBox(height: 20.0),
          AuthButton(
            onPressed: () {
              sendResetLink();
            },
            text: 'Send Reset Link',
            loadingText: 'Sending...',

          ),
        ],
      ),
    );
  }
}