import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'LexendDeca', fontSize: 10),
      bodySmall: TextStyle(fontFamily: 'LexendDeca'),
      bodyMedium: TextStyle(
        fontFamily: 'LexendDeca',
      ),
    ),
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
    ));
