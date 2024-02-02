import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'LexendDeca', fontSize: 10),
      bodySmall: TextStyle(fontFamily: 'LexendDeca'),
      bodyMedium: TextStyle(
        fontFamily: 'LexendDeca',
      ),
    ),
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      tertiary: Colors.black54,
      inversePrimary: Colors.grey.shade600,
    ));
