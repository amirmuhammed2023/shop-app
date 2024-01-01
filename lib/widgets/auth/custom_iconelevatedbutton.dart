import 'package:flutter/material.dart';

class customiconelevatedbutton extends StatelessWidget {
  const customiconelevatedbutton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.fontsz = 16});
  final String text;
  final double fontsz;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
        onPressed: onPressed,
        icon: Icon(Icons.abc),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: fontsz),
          ),
        ));
  }
}
