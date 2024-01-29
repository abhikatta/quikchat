// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:test_run_flutter/services/auth/auth_gate.dart';
import 'package:test_run_flutter/firebase_options.dart';
import 'package:test_run_flutter/themes/dark_mode.dart';
import 'package:test_run_flutter/themes/light_mode.dart';
// import 'package:test_run_flutter/auth/login_or_register.dart';
// import 'package:test_run_flutter/pages/login_page.dart';
// import 'package:test_run_flutter/pages/register_page.dart';
// import 'package:test_run_flutter/pages/test_login_page.dart';
// import 'package:test_run_flutter/pages/random_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const AuthGate(),
    );
    // return
  }
}
