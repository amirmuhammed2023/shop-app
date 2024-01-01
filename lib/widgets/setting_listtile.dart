import 'package:appwithfirebase/Provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class settinglisttile extends StatelessWidget {
  const settinglisttile({super.key});

  @override
  Widget build(BuildContext context) {
    final providerthemeinstance = Provider.of<themeprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          indent: 12,
          endIndent: 12,
          thickness: 2,
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SwitchListTile(
            secondary: Image.asset(
              "assets/images/profile/theme.png",
              height: 38,
            ),
            title: providerthemeinstance.isdark
                ? Text("Dark Mode")
                : Text("Light Mode"),
            value: providerthemeinstance.isdark,
            onChanged: (value) {
              providerthemeinstance.changedarktheme(isdarktheme: value);
              print(value);
            }),
        SizedBox(
          height: 12,
        ),
        Divider(
          indent: 12,
          endIndent: 12,
          thickness: 2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
      ],
    );
  }
}
