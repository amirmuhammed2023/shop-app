import 'package:appwithfirebase/constants/appconstant.dart';
import 'package:appwithfirebase/widgets/empty_bag.dart';
import 'package:appwithfirebase/widgets/productsbag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/cart_provider.dart';

class cartview extends StatelessWidget {
  const cartview({super.key});
  @override
  Widget build(BuildContext context) {
    final instancecartprovider = Provider.of<cartprovider>(context);

    return Scaffold(
        body: instancecartprovider.itemscart.isEmpty
            ? emptybag(
                image: appconstant.emptybag,
                title: "Your cart is empty",
                subtitle:
                    "Looks like you don\'t add any thing to your cart go ahead of explore top categories",
              )
            : productsbag());
  }
}
