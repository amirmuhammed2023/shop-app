import 'package:appwithfirebase/data/models/category_model.dart';

class appconstant {
  static const List bannerimage = [
    "assets/images/banners/banner1.png",
    "assets/images/banners/banner2.png"
  ];

  static List<categorymodel> categories = [
    categorymodel(
        image: "assets/images/categories/fashion.png", name: "men's clothing"),
    categorymodel(
        image: "assets/images/categories/pc.png", name: "electronics"),
    categorymodel(
        image: "assets/images/categories/shoes.png", name: "women's clothing"),
    categorymodel(
        image: "assets/images/categories/watch.png", name: "jewelery"),
  ];

  static String emptybag = "assets/images/bag/order.png";
  static String emptywish = "assets/images/bag/bag_wish.png";
  static String emptyorders = "assets/images/bag/shopping_basket.png";
  static String emptyhistory = "assets/images/bag/shopping_cart.png";
}
