import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/set_user_data.dart';
import 'package:whirl/backend/auth/validate_amizone_credentials.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';
import 'package:whirl/presentation/auth/widgets/logout_button.dart';

class AmizoneCredentialsInputScreen extends StatefulWidget {
  final Function reloadWidget;

  const AmizoneCredentialsInputScreen({super.key, required this.reloadWidget});

  @override
  State<AmizoneCredentialsInputScreen> createState() =>
      _AmizoneCredentialsInputScreenState();
}

class _AmizoneCredentialsInputScreenState
    extends State<AmizoneCredentialsInputScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    int saveCredentialsButtonState = 0;

    void changeSaveCredentialsButtonState(int state) {
      if (state < 0 || state > 3) {
        state = 0;
      }
      setState(() {
        saveCredentialsButtonState = state;
      });
      if (state != 1) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              saveCredentialsButtonState = 0;
            });
          }
        });
      }
    }

    Future<void> saveCredentials() async {
      if (formKey.currentState!.validate()) {
        changeSaveCredentialsButtonState(1);
        try {
          await SetUserData().set(FirebaseAuth.instance.currentUser!.uid, {
            "amizone_id": idController.text,
            "amizone_password": passwordController.text,
          }).then((value) {
            if (value == null) {
              changeSaveCredentialsButtonState(2);
              Future.delayed(const Duration(seconds: 5), () {
                widget.reloadWidget();
              });
            } else {
              changeSaveCredentialsButtonState(3);
            }
          });
        } catch (e) {
          changeSaveCredentialsButtonState(3);
        }

      }
    }

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  add a form to input amizone credentials
            const Text('Please enter your Amizone credentials'),
            const SizedBox(height: 16.0),
            InputField(
              controller: idController,
              hintText: "Amizone ID",
              keyboardType: TextInputType.number,
              validator: ValidateAmizoneCredentials().validateAmizoneID,
            ),
            const SizedBox(height: 16.0),
            InputField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              validator: ValidateAmizoneCredentials().validateAmizonePassword,
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
              hintText: "Amizone Password",
            ),
            const SizedBox(height: 16.0),
            AuthButton(
              onPressed: () => saveCredentials(),
              text: 'Save Credentials',
              loadingText: 'Saving...',
              state: saveCredentialsButtonState,
            ),
            const SizedBox(height: 16.0),
            const LogoutButton(returnScreen: LoginScreen()),
          ],
        ),
      ),
    );
  }
}
