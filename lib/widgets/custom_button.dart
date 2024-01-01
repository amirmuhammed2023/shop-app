import 'package:appwithfirebase/widgets/custom_alertdialog.dart';
import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  const custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            elevation: 5,
          ),
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return customalertdialog();
                });
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          label: Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
