import 'package:flutter/material.dart';

class customimagecart extends StatelessWidget {
  const customimagecart({super.key, this.width, required this.image});
  final double? width;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: NetworkImage(
          image,
        )),
      ),
    );
  }
}
