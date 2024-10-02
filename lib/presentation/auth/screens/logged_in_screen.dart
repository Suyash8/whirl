import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whirl/backend/auth/fetch_user_data.dart';
import 'package:whirl/backend/auth/set_user_data.dart';
import 'package:whirl/presentation/auth/screens/amizone_credentials_input_screen.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';
import 'package:whirl/presentation/auth/widgets/auth_button.dart';
import 'package:whirl/presentation/auth/widgets/logout_button.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }

    void reloadWidget() {
      setState(() {});
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: FetchUserData().fetch(FirebaseAuth.instance.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Error fetching user data'),
                    const SizedBox(height: 16.0),
                    AuthButton(onPressed: reloadWidget, text: 'Retry'),
                    const SizedBox(height: 16.0),
                    const LogoutButton(returnScreen: LoginScreen(),),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              final userData = snapshot.data!;
              if (userData["amizone_id"] != null &&
                  userData["amizone_password"] != null &&
                  userData["amizone_id"] != "" &&
                  userData["amizone_password"] != "") {
                return HomeScreen(
                    userData: userData, reloadWidget: reloadWidget);
              }
              return AmizoneCredentialsInputScreen(reloadWidget: reloadWidget);
            }
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error logging in'),
                  SizedBox(height: 16.0),
                  LogoutButton(returnScreen: LoginScreen(),),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  final Function reloadWidget;

  const HomeScreen(
      {super.key, required this.userData, required this.reloadWidget});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${userData["name"]}'),
            Text('Your Amizone ID is ${userData["amizone_id"]}'),
            Text('Your Amizone password is ${userData["amizone_password"]}'),
            const SizedBox(height: 16.0),
            AuthButton(
                onPressed: () {
                  SetUserData().set(FirebaseAuth.instance.currentUser!.uid, {
                    "amizone_id": "",
                    "amizone_password": "",
                  });
                  reloadWidget();
                },
                text: 'Delete Credentials'),
            const SizedBox(height: 16.0),
            const LogoutButton(returnScreen: LoginScreen()),
          ],
        ),
      ),
    );
  }
}

