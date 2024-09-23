import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/set_user_data.dart';
import 'package:whirl/core/theme/component_decoration.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';
import 'package:whirl/presentation/auth/widgets/logout_button.dart';

class AmizoneCredentialsInputScreen extends StatelessWidget {
  final Function reloadWidget;
  const AmizoneCredentialsInputScreen({super.key, required this.reloadWidget});

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  add a form to input amizone credentials
          const Text('Please enter your Amizone credentials'),
          const SizedBox(height: 16.0),
          InputField(controller: idController, hintText: "Amizone ID"),
          const SizedBox(height: 16.0),
          InputField(
              controller: passwordController, hintText: "Amizone Password"),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              SetUserData().set(FirebaseAuth.instance.currentUser!.uid, {
                "amizone_id": idController.text,
                "amizone_password": passwordController.text,
              });
              reloadWidget();
            },
            style: ComponentDecoration.buttonDecoration(
                colorScheme: Theme.of(context).colorScheme),
            child: const Text('Save Credentials'),
          ),
          const SizedBox(height: 16.0),
          const LogoutButton(returnScreen: LoginScreen()),
        ],
      ),
    );
  }
}
