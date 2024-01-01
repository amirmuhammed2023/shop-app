import 'package:flutter/material.dart';

class customtextbutton extends StatelessWidget {
  const customtextbutton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
      ),
    );
  }
}
