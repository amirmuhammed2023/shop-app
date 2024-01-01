import 'package:appwithfirebase/Provider/theme_provider.dart';
import 'package:appwithfirebase/constants/appauth.dart';
import 'package:appwithfirebase/constants/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class emaildetails extends StatelessWidget {
  const emaildetails({super.key});

  @override
  Widget build(BuildContext context) {
    final providerthemeinstance = Provider.of<themeprovider>(context);
    return ListTile(
      visualDensity: VisualDensity(vertical: 3, horizontal: 2),
      leading: CircleAvatar(
        backgroundColor: providerthemeinstance.isdark
            ? appcolor.darkprimary
            : appcolor.lightprimary,
        radius: 32.5,
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            "assets/images/profilepage.jpg",
          ),
        ),
      ),
      title: Text(
        "Amir",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        appauth().auth.currentUser!.email ?? " ",
        style: TextStyle(fontSize: 16),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit,
          )),
    );
  }
}
