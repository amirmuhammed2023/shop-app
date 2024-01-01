import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/widgets/custom_iconbuttonheart.dart';
import 'package:flutter/material.dart';

class sectionbuttonsdetails extends StatelessWidget {
  const sectionbuttonsdetails({super.key, required this.singleprod});
  final Product1 singleprod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          customiconbuttonheart(
            singleproduct: singleprod,
            materialcolors: Colors.blue.shade100,
            size: 22,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_reaction_outlined),
                label: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Item added to cart",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
