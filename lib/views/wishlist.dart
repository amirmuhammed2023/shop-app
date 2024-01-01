import 'package:appwithfirebase/Provider/wishlist_provider.dart';
import 'package:appwithfirebase/constants/appconstant.dart';
import 'package:appwithfirebase/widgets/empty_bag.dart';
import 'package:appwithfirebase/widgets/profile%20general%20list/wishlist_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class wishlistview extends StatelessWidget {
  const wishlistview({super.key});
  static const id = "/wishlistview";
  @override
  Widget build(BuildContext context) {
    final instancecartprovider = Provider.of<wishlistprovider>(context);
    return instancecartprovider.wishlist.isEmpty
        ? Scaffold(
            body: emptybag(
            image: appconstant.emptywish,
            title: "There are no favorite products",
            subtitle:
                "You can go to the store and choose your favorite product",
          ))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Wishlist",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.red.shade300),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return wishlistproduct(
                    wishproduct: instancecartprovider.wishlist[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: instancecartprovider.wishlist.length),
          );
  }
}
