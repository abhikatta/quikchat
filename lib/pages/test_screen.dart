import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Test Screen",
            style: TextStyle(fontSize: 50, color: Colors.red)),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back"))
      ])),
    ));
  }
}
