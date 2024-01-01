import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/data/repository/productsrepo.dart';
import 'package:flutter/material.dart';

class productsprovider with ChangeNotifier {
  final productsrepo repoproduct;
  bool isloading = false;
  List<Product1> _allproducts1 = [];
  List<Product1> _ctgproduct = [];
  List<Product1> _searchedproducts = [];

  List<Product1> get searchedproductsgetter {
    return _searchedproducts;
  }

  List<Product1> get ctgproductsgetter {
    return _ctgproduct;
  }

  List<Product1> get allproductsgetter {
    return _allproducts1;
  }

  productsprovider(this.repoproduct);

  fetchallproducts() async {
    isloading = true;
    notifyListeners();
    _allproducts1 = await repoproduct.getallproducts();
    isloading = false;
    notifyListeners();
    //print("provider ctgproduct : $_allproducts1");
  }

  fetchctgproducts(String ctg) async {
    isloading = true;
    notifyListeners();
    _ctgproduct = await repoproduct.getbycategory(ctg);
    isloading = false;
    notifyListeners();

    //print("provider ctgproduct : $_ctgproduct");
  }

  fetchsearchedproducts(String name) async {
    isloading = true;
    notifyListeners();
    _searchedproducts = await repoproduct.getbysearched(name);
    isloading = false;
    notifyListeners();
    print("provider searchedproduct : $_searchedproducts");
  }
}
