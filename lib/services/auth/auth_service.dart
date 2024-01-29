import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // sign in method
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // sign out method
  Future<void> signOut() async {
    return await _auth.signOut();
  }
  // register

  Future<UserCredential> signUpWithEmailPassword(
      String email, password, confirmPassword) async {
    if (password == confirmPassword &&
        password.toString().trim() != '' &&
        confirmPassword.toString().trim() != '') {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw Exception(e.message);
      }
    } else {
      throw Exception('Passwords do not Match! Please try again.');
    }
  }
  // errors
}
