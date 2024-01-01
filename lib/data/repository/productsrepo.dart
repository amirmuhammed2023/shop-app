import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/data/service/productsapi.dart';
import 'package:dio/dio.dart';

class productsrepo {
  final productsapi productsapi1;

  productsrepo(this.productsapi1);

  Future<List<Product1>> getallproducts() async {
    try {
      var data = await productsapi1.getapi(endpoint: "products");
      List<Product1> allproductslist = [];
      //print("beforeadded : $allproductslist");
      for (var product in data) {
        allproductslist.add(Product1.fromJson(product));
      }
      //print("after added : $allproductslist ");
      return allproductslist;
    } catch (e) {
      if (e is DioException) {
        print("dio excep");
        return [];
      } else {
        print(e.toString());
        return [];
      }
    }
  }

  Future<List<Product1>> getbycategory(String ctg) async {
    try {
      var data = await productsapi1.getapi(endpoint: "products/category/$ctg");
      List<Product1> ctgproductslist = [];
      //print("beforeadded : $ctgproductslist");
      for (var product in data) {
        ctgproductslist.add(Product1.fromJson(product));
      }
      //print("after added : $ctgproductslist ");
      return ctgproductslist;
    } catch (e) {
      if (e is DioException) {
        print("dio excep");
        return [];
      } else {
        print(e.toString());
        return [];
      }
    }
  }

  Future<List<Product1>> getbysearched(String name) async {
    try {
      var data = await productsapi1.getapi(endpoint: "products");

      List<Product1> searchedproductslist = [];
      print("beforeadded : $searchedproductslist");

      for (var product in data) {
        if (Product1.fromJson(product)
            .title!
            .toLowerCase()
            .contains(name.toLowerCase())) {
          searchedproductslist.add(Product1.fromJson(product));
        }
      }
      print("afteradded : $searchedproductslist");
      return searchedproductslist;
    } catch (e) {
      if (e is DioException) {
        print("dio excep");
        return [];
      } else {
        print(e.toString());
        return [];
      }
    }
  }
}
