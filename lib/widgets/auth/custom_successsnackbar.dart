import 'package:appwithfirebase/constants/appcolor.dart';
import 'package:flutter/material.dart';

class customsuccesssnackbar extends StatelessWidget {
  const customsuccesssnackbar({super.key, required this.successmessage});
  final String successmessage;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appcolor.successsnackbarcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Success Process",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                successmessage,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
