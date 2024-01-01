import 'package:appwithfirebase/widgets/custom_appbar.dart';
import 'package:appwithfirebase/widgets/custom_button.dart';
import 'package:appwithfirebase/widgets/email_details.dart';
import 'package:appwithfirebase/widgets/general_listtile.dart';
import 'package:appwithfirebase/widgets/setting_listtile.dart';
import 'package:flutter/material.dart';

class profileview extends StatelessWidget {
  const profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customappbar(title: "Smart Shop"),
            emaildetails(),
            generallisttile(),
            settinglisttile(),
            custombutton()
          ],
        ),
      ),
    );
  }
}
