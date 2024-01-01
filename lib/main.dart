import 'dart:io';

import 'package:appwithfirebase/Provider/allorders_provider.dart';
import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/Provider/history_provider.dart';
import 'package:appwithfirebase/Provider/products_provider.dart';
import 'package:appwithfirebase/Provider/theme_provider.dart';
import 'package:appwithfirebase/Provider/wishlist_provider.dart';
import 'package:appwithfirebase/constants/appthemedata.dart';
import 'package:appwithfirebase/data/repository/productsrepo.dart';
import 'package:appwithfirebase/data/service/productsapi.dart';
import 'package:appwithfirebase/views/all_orders.dart';
import 'package:appwithfirebase/views/auth/login_view.dart';
import 'package:appwithfirebase/views/auth/register_view.dart';
import 'package:appwithfirebase/views/details_view.dart';
import 'package:appwithfirebase/views/history_view.dart';
import 'package:appwithfirebase/views/root_view.dart';
import 'package:appwithfirebase/views/search_view.dart';
import 'package:appwithfirebase/views/wishlist.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyBbY2Z9gS7UfDpXQmqjCax2IoKzM8Mu6e4",
              appId: "1:418805102184:android:6f247bd3097625c3326ddd",
              messagingSenderId: "418805102184",
              projectId: "smart-shop-df3fd"))
      : await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) {
      return themeprovider();
    }),
    ChangeNotifierProvider(create: (context) {
      return productsprovider(productsrepo(productsapi(Dio())));
    }),
    ChangeNotifierProvider(create: (context) {
      return cartprovider();
    }),
    ChangeNotifierProvider(create: (context) {
      return wishlistprovider();
    }),
    ChangeNotifierProvider(create: (context) {
      return allordersprovider();
    }),
    ChangeNotifierProvider(create: (context) {
      return historyprovider();
    }),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final providerthemeinstance = Provider.of<themeprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appthemedata.apptheme(
          isdark: providerthemeinstance.isdark, context: context),
      home: loginview(),
      routes: {
        detailsview.id: (context) => detailsview(),
        loginview.id: (context) => loginview(),
        registerview.id: (context) => registerview(),
        allorders.id: (context) => allorders(),
        searchview.id: (context) => searchview(),
        wishlistview.id: (context) => wishlistview(),
        historyview.id: (context) => historyview(),
        rootview.id: (context) => rootview(),
      },
    );
  }
}
