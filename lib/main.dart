import 'package:flutter/material.dart';
import 'package:whirl/core/theme/app_theme.dart';
import 'package:whirl/presentation/auth/screens/login_screen.dart';

void main() {
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
