import 'package:appwithfirebase/constants/appauth.dart';
import 'package:appwithfirebase/constants/appvalidator.dart';
import 'package:appwithfirebase/views/auth/login_view.dart';
import 'package:appwithfirebase/widgets/auth/custom_elevatedbutton.dart';
import 'package:appwithfirebase/widgets/auth/custom_errorsnackbar.dart';
import 'package:appwithfirebase/widgets/auth/custom_pickerimage.dart';
import 'package:appwithfirebase/widgets/auth/custom_successsnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class registerview extends StatefulWidget {
  registerview({super.key});
  static const id = "/registerview";

  @override
  State<registerview> createState() => _registerviewState();
}

class _registerviewState extends State<registerview> {
  final globalkeyy = GlobalKey<FormState>();

  final test = appauth();

  String? em, pss;

  XFile? picked;

  bool hiddenpass = true, hiddenrepeatpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Shimmer.fromColors(
            child: Text(
              "Shop Smart",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            period: Duration(seconds: 6),
            baseColor: Colors.purple,
            highlightColor: Colors.red),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: globalkeyy,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                    "Sign up now to recieve special offers and updates from our app ."),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                custompickerimage(
                  pickedimage: picked,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "User123",
                    prefixIcon: Icon(Icons.person_2_outlined),
                  ),
                  validator: (valueee) {
                    return appvalidator.username(valueee!);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "youremail@gmail.com",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  onChanged: (val) {
                    em = val;
                  },
                  validator: (valueee) {
                    return appvalidator.emailvalidator(valueee!);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: hiddenpass,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hiddenpass = !hiddenpass;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye)),
                  ),
                  onChanged: (val) {
                    pss = val;
                  },
                  validator: (valueee) {
                    return appvalidator.passwordvalidator(valueee!);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: hiddenrepeatpass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Reapeat Password",
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hiddenrepeatpass = !hiddenrepeatpass;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye)),
                  ),
                  validator: (valueee) {
                    if (pss == null) {
                      return "Enter password first";
                    } else {
                      return appvalidator.passwordrepeatvalidator(
                          pss!, valueee!);
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                    width: double.infinity,
                    child: customelevatedbutton(
                        text: "Sign up",
                        onPressed: () async {
                          if (globalkeyy.currentState!.validate()) {
                            try {
                              await test.register(em!, pss!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: customsuccesssnackbar(
                                      successmessage:
                                          "E-mail successfully created"),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                              Navigator.pushNamed(context, loginview.id);
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: customerrorsnackar(
                                  errmessage: e.message!,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ));
                            }
                          }
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
