// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const MyButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.red))),
          side: MaterialStateProperty.all(BorderSide(
              color: Theme.of(context).colorScheme.tertiary, width: 0)),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).colorScheme.secondary),
        ),
        child: Container(
          // padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
          // alignment: Alignment.center,
          // decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.secondary,
          // borderRadius: BorderRadius.circular(100)),

          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
