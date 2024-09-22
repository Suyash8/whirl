import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/fetch_user_data.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';
import 'package:whirl/presentation/auth/widgets/input_field.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }

    Widget logoutButton() {
      return ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        child: const Text('Logout'),
      );
    }

    return Scaffold(
      body: FutureBuilder(
        future: FetchUserData().fetch(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error fetching user data'),
                  const SizedBox(height: 16.0),
                  logoutButton(),
                ],
              ),
            );
          }
          else if (snapshot.hasData) {
            final userData = snapshot.data!;
            if (userData["amizone_id"] != null &&
                userData["amizone_password"] != null &&
                userData["amizone_id"] != "" &&
                userData["amizone_password"] != "") {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome ${userData["name"]}'),
                    Text('Your Amizone ID is ${userData["amizone_id"]}'),
                    Text('Your Amizone password is ${userData["amizone_password"]}'),
                    const SizedBox(height: 16.0),
                    logoutButton(),
                  ],
                ),
              );
            }
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
                  InputField(controller: passwordController, hintText: "Amizone Password"),
                  ElevatedButton(
                    onPressed: () {
                      // save the credentials to the database
                      // and show the user data
                    },
                    child: const Text('Save'),
                  ),
                  logoutButton(),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Error logging in'),
                const SizedBox(height: 16.0),
                logoutButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
