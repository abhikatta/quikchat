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
          cursorColor: Colors.blue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Colors.white,
                )),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Colors.grey,
                )),
            hintText: hintText,
          ),
        ));
  }
}
