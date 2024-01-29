import 'package:flutter/material.dart';
import 'package:test_run_flutter/services/auth/auth_service.dart';
import 'package:test_run_flutter/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBABA99),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        title: const Text('Weather Page'),
      ),
    );
  }
}
