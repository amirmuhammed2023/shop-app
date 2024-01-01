import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';

class allordersprovider extends ChangeNotifier {
  List<Product1> allorderslist = [];

  addtoallorders(Product1 product) {
    allorderslist.add(product);
    notifyListeners();
  }

  removefromallorders(Product1 product) {
    allorderslist.remove(product);
    notifyListeners();
  }
}
