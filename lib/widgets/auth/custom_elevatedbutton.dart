import 'package:flutter/material.dart';

class customelevatedbutton extends StatelessWidget {
  const customelevatedbutton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.fontsz = 18});
  final String text;
  final double fontsz;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: fontsz),
          ),
        ));
  }
}
