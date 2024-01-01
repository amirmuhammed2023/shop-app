import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/widgets/bottom_listprice.dart';
import 'package:appwithfirebase/widgets/custom_appbar.dart';
import 'package:appwithfirebase/widgets/item_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productsbag extends StatelessWidget {
  const productsbag({super.key});

  @override
  Widget build(BuildContext context) {
    final instancecartprovider = Provider.of<cartprovider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customappbar(title: "Cart"),
            IconButton(
                onPressed: () {
                  instancecartprovider.clearcart();
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                  size: 32,
                ))
          ],
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: instancecartprovider.itemscart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 4, left: 2, bottom: 10),
                  child: itemincart(index1: index),
                );
              }),
        ),
        Divider(
          height: 3,
        ),
        bottomlistprice(),
      ],
    );
  }
}
