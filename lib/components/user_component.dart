import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const UserComponent({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).colorScheme.tertiary),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Icon(Icons.person_outline),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                )
              ]),
            )));
  }
}
