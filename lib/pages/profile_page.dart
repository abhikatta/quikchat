import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(fontFamily: 'LexendDeca', fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        ),
        body: Center(
            child: ListView(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    const Text('Gmail: '),
                    Text(_firebaseAuth.currentUser!.email ?? 'Guest@gmail.com'),
                  ],
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(children: [
                  const Text('Username: '),
                  Text(
                    _firebaseAuth.currentUser!.displayName ?? 'Guest',
                  ),
                ])),
          ],
        )));
  }
}
