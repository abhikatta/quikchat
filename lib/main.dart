import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:quikchat/services/auth/auth_gate.dart';
import 'package:quikchat/firebase_options.dart';
import 'package:quikchat/themes/dark_mode.dart';
import 'package:quikchat/themes/light_mode.dart';

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
