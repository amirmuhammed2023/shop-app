import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeprovider with ChangeNotifier {
  static const themestatus = "theme_status";
  bool isdark = false;

  changedarktheme({required bool isdarktheme}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(themestatus, isdarktheme);
    isdark = pref.getBool(themestatus) ?? false;
    notifyListeners();
  }
}
