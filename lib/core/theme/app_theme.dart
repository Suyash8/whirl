import 'package:flutter/material.dart';

class AppTheme {
  final bool material3;
  final MaterialColor color;
  final bool isDark;
  final ThemeData theme;

  AppTheme({
    this.material3 = true,
    this.color = Colors.blue,
    this.isDark = true,
  }) : theme = ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: color,
              brightness: isDark ? Brightness.dark : Brightness.light),
          useMaterial3: material3,
        );
}
