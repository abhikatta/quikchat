import 'package:flutter/material.dart';
import 'package:test_run_flutter/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      body: const Column(children: [
        Text('home page'),
      ]),
    );
  }
}
