import 'package:flutter/material.dart';

class sectionaboutitemindetails extends StatelessWidget {
  const sectionaboutitemindetails(
      {super.key,
      required this.productdescription,
      required this.productcategory});
  final String productcategory, productdescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "About this item",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
              Text(
                productcategory,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            productdescription,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
