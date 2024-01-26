// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final bool obscureText;

  const MyInput(
      {super.key,
      required this.inputController,
      required this.obscureText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          autofillHints: null,
          controller: inputController,
          obscureText: obscureText,
          decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.tertiary,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              )),
        ));
  }
}
