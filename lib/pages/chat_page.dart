import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String email;
  const ChatPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          title: Text(email),
          centerTitle: true,
        ),
        body: const Text('Chat page'));
  }
}
