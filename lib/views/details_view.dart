import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/widgets/imageindetailsview.dart';
import 'package:appwithfirebase/widgets/section_aboutitemindetails.dart';
import 'package:appwithfirebase/widgets/section_buttonsdetails.dart';
import 'package:appwithfirebase/widgets/section_titleindetails.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class detailsview extends StatelessWidget {
  const detailsview({super.key});
  static const id = "/detailsview";
  @override
  Widget build(BuildContext context) {
    final getproduct = ModalRoute.of(context)!.settings.arguments as Product1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Shimmer.fromColors(
            baseColor: Colors.purple,
            highlightColor: Colors.red,
            period: Duration(seconds: 6),
            child: Text(
              "Shop Smart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.shopping_basket_outlined,
              size: 28,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageindetailsview(productimage: getproduct.image!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  sectiontitleindetails(
                      productprice: getproduct.price!.toString(),
                      producttitle: getproduct.title!),
                  sectionbuttonsdetails(
                    singleprod: getproduct,
                  ),
                  sectionaboutitemindetails(
                    productcategory: getproduct.category!,
                    productdescription: getproduct.description!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
