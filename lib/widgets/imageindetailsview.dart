import 'package:flutter/material.dart';

class imageindetailsview extends StatelessWidget {
  const imageindetailsview({super.key, required this.productimage});
  final String productimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(productimage)),
      ),
    );
  }
}
