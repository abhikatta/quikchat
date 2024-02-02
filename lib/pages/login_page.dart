// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quikchat/services/auth/auth_service.dart';
import 'package:quikchat/components/my_button.dart';
import 'package:quikchat/components/my_input.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
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
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // logo

          const Icon(
            Icons.message,
            size: 40,
          ),

          const SizedBox(
            height: 50,
          ),

          Text(
            "Welcome Back! Let's get started!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 20),
          ),
          SizedBox(
            height: 25,
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
            height: 25,
          ),
          MyButton(
            onTap: () => login(context),
            buttonText: 'Login',
          ),
          SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Not a member?',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            TextButton(
              onPressed: onTap,
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 5)),
                overlayColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.background),
              ),
              child: Text(
                'Register Now!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            )
          ]),
        ])));
  }
}
