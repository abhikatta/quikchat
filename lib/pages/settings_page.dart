import 'package:flutter/material.dart';
import 'package:quikchat/components/my_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
          child: Text(
        'Still Todo',
        style: TextStyle(fontSize: 35),
      )),
    );
  }
}
