import 'package:flutter/material.dart';

class sectiontitleindetails extends StatelessWidget {
  const sectiontitleindetails(
      {super.key, required this.producttitle, required this.productprice});
  final String producttitle, productprice;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            producttitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "\$ ${productprice}",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
        )
      ],
    );
  }
}
