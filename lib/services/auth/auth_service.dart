import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign in method
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // creating account for chat
      _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'displayName': userCredential.user!.displayName ?? 'Guest',
        'uid': userCredential.user!.uid,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // sign out method
  Future<void> signOut() async {
    return await _auth.signOut();
  }

// get current user
  User? getCurrentUser() {
    try {
      return _auth.currentUser!;
    } on FirebaseAuthException catch (e) {
      AlertDialog(
        title: Text("Error: ${e.code.toString()}"),
        content: Text(e.message.toString()),
      );
      return null;
    }
  }

  // register
  Future<UserCredential> signUpWithEmailPassword(String email, String username,
      String password, String confirmPassword) async {
    if (password == confirmPassword &&
        username.toString().trim() != '' &&
        email.toString().trim() != '' &&
        password.toString().trim() != '' &&
        confirmPassword.toString().trim() != '') {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        userCredential.user!.updateDisplayName(username);
        // creating account for chat
        _firestore.collection('Users').doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'displayName': userCredential.user!.displayName,
        });
        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw Exception(e.message);
      }
    } else if (password != confirmPassword &&
        password.trim() != '' &&
        confirmPassword.trim() != '') {
      throw Exception('Passwords do not Match! Please try again.');
    } else {
      throw Exception('Please enter all the details and try again.');
    }
  }
  // errors
}
