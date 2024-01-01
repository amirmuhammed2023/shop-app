import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';

class cartprovider extends ChangeNotifier {
  List<Product1> itemscart = [];
  double totalprice = 0;
  int productsnumber = 0;

  addtocart(Product1 product) {
    itemscart.add(product);

    totalprice += product.price!;
    productsnumber++;
    notifyListeners();
  }

  removefromcart(Product1 product) {
    itemscart.remove(product);
    totalprice = totalprice - (product.price! * product.quantity);
    productsnumber--;
    notifyListeners();
  }

  clearcart() {
    totalprice = 0;
    productsnumber = 0;
    itemscart.clear();
    notifyListeners();
  }

  quantityfunction(Product1 prod, int num) {
    prod.quantity = num;
    totalprice = 0;
    for (var element in itemscart) {
      totalprice = totalprice + (element.price! * element.quantity);
    }
    notifyListeners();
  }
}
