import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';

class historyprovider extends ChangeNotifier {
  List<Product1> historylist = [];
  addtohistory(Product1 product) {
    historylist.add(product);
    notifyListeners();
  }

  removefromhistory(Product1 product) {
    historylist.remove(product);
    notifyListeners();
  }
}
