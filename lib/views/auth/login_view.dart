import 'package:appwithfirebase/constants/appauth.dart';
import 'package:appwithfirebase/constants/appcolor.dart';
import 'package:appwithfirebase/constants/appvalidator.dart';
import 'package:appwithfirebase/views/auth/register_view.dart';
import 'package:appwithfirebase/views/root_view.dart';
import 'package:appwithfirebase/widgets/auth/custom_elevatedbutton.dart';
import 'package:appwithfirebase/widgets/auth/custom_errorsnackbar.dart';
import 'package:appwithfirebase/widgets/auth/custom_iconelevatedbutton.dart';
import 'package:appwithfirebase/widgets/auth/custom_successsnackbar.dart';
import 'package:appwithfirebase/widgets/auth/custom_textbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class loginview extends StatefulWidget {
  loginview({super.key});
  static const id = "/loginview";

  @override
  State<loginview> createState() => _loginviewState();
}

class _loginviewState extends State<loginview> {
  final globalkey = GlobalKey<FormState>();

  final test = appauth();

  String? em, pss;

  bool hiddenpass = true;

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
        child: Form(
          key: globalkey,
          child: SingleChildScrollView(
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
                Text("Let's get you logged in so you can start exploring ."),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: customtextbutton(
                      text: "Forgot Password", onPressed: () {}),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                    width: double.infinity,
                    child: customelevatedbutton(
                      onPressed: () async {
                        if (globalkey.currentState!.validate()) {
                          try {
                            await test.login(em!, pss!);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: customsuccesssnackbar(
                                    successmessage: "Wait a few seconds"),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                            Navigator.pushReplacementNamed(
                                context, rootview.id);
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: customerrorsnackar(
                                errmessage: e.message!,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ));
                          }
                        }
                      },
                      text: "Sign In",
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Text(
                    "or connect using".toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customiconelevatedbutton(
                      onPressed: () {},
                      text: "Sign In with Google",
                    ),
                    customelevatedbutton(
                      text: "Geust?",
                      fontsz: 16,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don\'t have an account ?",
                      style: TextStyle(fontSize: 18),
                    ),
                    customtextbutton(
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.pushNamed(context, registerview.id);
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
