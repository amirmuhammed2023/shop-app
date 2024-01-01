import 'dart:math';

import 'package:appwithfirebase/Provider/wishlist_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class wishlistproduct extends StatelessWidget {
  const wishlistproduct({super.key, required this.wishproduct});
  final Product1 wishproduct;
  @override
  Widget build(BuildContext context) {
    final instanceprovider = Provider.of<wishlistprovider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Image.network(
            wishproduct.image ?? "",
            height: 150,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Text(
                        wishproduct.title ?? "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          instanceprovider.removewish(wishproduct);
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Price: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${wishproduct.price} \$",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
