import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class customappbar extends StatelessWidget {
  const customappbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bag/shopping_cart.png"))),
          ),
          SizedBox(
            width: 30,
          ),
          Shimmer.fromColors(
            baseColor: Colors.purple,
            highlightColor: Colors.red,
            period: Duration(seconds: 6),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
