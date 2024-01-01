import 'package:appwithfirebase/constants/appauth.dart';
import 'package:appwithfirebase/views/auth/login_view.dart';
import 'package:flutter/material.dart';

class customalertdialog extends StatelessWidget {
  const customalertdialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/warning.png",
            height: 60,
            width: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Are you sure ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.red, fontSize: 18),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              appauth().logout();
              Navigator.pushReplacementNamed(context, loginview.id);
            },
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ))
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
