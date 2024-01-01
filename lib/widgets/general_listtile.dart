import 'package:appwithfirebase/views/all_orders.dart';
import 'package:appwithfirebase/views/history_view.dart';
import 'package:appwithfirebase/views/wishlist.dart';
import 'package:appwithfirebase/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';

class generallisttile extends StatelessWidget {
  const generallisttile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "General",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.018,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, allorders.id);
          },
          child: customlisttile(
            tiledimage: "assets/images/bag/order_svg.png",
            tiledtitle: "All Order",
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, wishlistview.id);
          },
          child: customlisttile(
            tiledimage: "assets/images/bag/wishlist_svg.png",
            tiledtitle: "Wishlist",
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, historyview.id);
          },
          child: customlisttile(
            tiledimage: "assets/images/profile/recent.png",
            tiledtitle: "History",
          ),
        ),
        customlisttile(
          tiledimage: "assets/images/profile/address.png",
          tiledtitle: "Address",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.013,
        ),
      ],
    );
  }
}
