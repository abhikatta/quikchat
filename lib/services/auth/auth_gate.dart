import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quikchat/services/auth/login_or_register.dart';
import 'package:quikchat/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

// constantly listening if any user is singed in or not. Just like onAuthStateChanged in web sdk.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
