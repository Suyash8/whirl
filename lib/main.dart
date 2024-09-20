import 'package:flutter/material.dart';
import 'package:whirl/core/theme/app_theme.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  try {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  } catch (e) {
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().theme,
      home: LoginScreen(),
    );
  }
}
