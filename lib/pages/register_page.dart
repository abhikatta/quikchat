// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quikchat/services/auth/auth_service.dart';
import 'package:quikchat/components/my_button.dart';
import 'package:quikchat/components/my_input.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthService auth = AuthService();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  void register(BuildContext context) async {
    try {
      await auth.signUpWithEmailPassword(
          _emailController.text,
          _usernameController.text,
          _passwordController.text,
          _confirmPasswordController.text);

      await auth.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(children: [
          Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            // logo
            SizedBox(
              height: 50,
            ),

            const Icon(
              Icons.message,
              size: 40,
            ),

            const SizedBox(
              height: 50,
            ),

            Text(
              'Create a new account!',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20),
            ),

            SizedBox(
              height: 25,
            ),
            MyInput(
              hintText: 'Username',
              obscureText: false,
              inputController: _usernameController,
            ),
            SizedBox(
              height: 15,
            ),
            MyInput(
              hintText: 'Email',
              obscureText: false,
              inputController: _emailController,
            ),
            SizedBox(
              height: 15,
            ),
            MyInput(
              inputController: _passwordController,
              obscureText: true,
              hintText: 'Password',
            ),
            SizedBox(
              height: 15,
            ),
            MyInput(
              hintText: 'Confirm Password',
              obscureText: true,
              inputController: _confirmPasswordController,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: () => register(context),
              buttonText: 'Register',
            ),
            SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Already have an account?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              TextButton(
                onPressed: onTap,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 1)),
                  overlayColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.background),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              )
            ]),
          ]))
        ]));
  }
}
