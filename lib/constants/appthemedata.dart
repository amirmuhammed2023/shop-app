import 'package:appwithfirebase/constants/appcolor.dart';
import 'package:flutter/material.dart';

class appthemedata {
  static ThemeData apptheme(
      {required bool isdark, required BuildContext context}) {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.all(14),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: isdark ? Colors.white : Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        brightness: isdark ? Brightness.dark : Brightness.light,
        cardColor:
            isdark ? appcolor.darkscaffoldcolor : appcolor.lightcardcolor,
        scaffoldBackgroundColor:
            isdark ? appcolor.darkscaffoldcolor : appcolor.lightscaffoldcolor);
  }
}
