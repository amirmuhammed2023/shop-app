import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wishlistprovider extends ChangeNotifier {
  List<Product1> wishlist = [];
  /*static const heartstatus = "heart_status";
  changestatusheart(Product1 product) async {
    product.loveit = isfavorite;

    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(heartstatus, isfavorite);
    isfavorite = pref.getBool(heartstatus) ?? false;
    notifyListeners();
  }

  changeisfavorite() {
    isfavorite = !isfavorite;
    notifyListeners();
  }*/
  //bool? love ;

  /*onpressheart(Product1 product) {
    product.loveit = !love;
    notifyListeners();
  }*/
  addwish(Product1 prod) {
    wishlist.add(prod);
    prod.loveit = true;
    notifyListeners();
  }

  removewish(Product1 prod) {
    wishlist.remove(prod);
    prod.loveit = false;
    notifyListeners();
  }

  functionsolveproblem(Product1 pr) {
    pr.loveit = !pr.loveit;
    if (pr.loveit == true) {
      wishlist.add(pr);
    } else {
      wishlist.remove(pr);
    }
    notifyListeners();
  }
  /*addtowishlist(Product1 product, bool istrue) {
    product.loveit = istrue;
    print(product.loveit);
    if (product.loveit == true) {
      wishlist.add(product);
    } else {
      wishlist.remove(product);
    }

    /*product.loveit = !love;
      print(product.loveit);

    if (product.loveit == true) {
      wishlist.add(product);
    } else {
      wishlist.remove(product);
    }*/
    notifyListeners();
  }*/
}
