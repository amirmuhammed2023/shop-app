import 'package:flutter/material.dart';

class customlisttile extends StatelessWidget {
  const customlisttile(
      {super.key, required this.tiledimage, required this.tiledtitle});
  final String tiledimage, tiledtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        tiledimage,
        height: 38,
      ),
      title: Text(
        tiledtitle,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
    );
  }
}
