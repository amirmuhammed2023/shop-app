import 'package:appwithfirebase/constants/appcolor.dart';
import 'package:flutter/material.dart';

class customerrorsnackar extends StatelessWidget {
  const customerrorsnackar({super.key, required this.errmessage});
  final String errmessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: appcolor.errorsnackcolor,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oh An Error !",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              errmessage.toString(),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
