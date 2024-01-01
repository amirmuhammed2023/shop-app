import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/Provider/products_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/widgets/custom_iconbuttonheart.dart';
import 'package:appwithfirebase/widgets/custom_image_cart.dart';
import 'package:appwithfirebase/widgets/custom_outlinedbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class itemincart extends StatelessWidget {
  const itemincart({super.key, required this.index1});
  final int index1;
  @override
  Widget build(BuildContext context) {
    final instanceproduct = Provider.of<cartprovider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Row(
        children: [
          customimagecart(
              image: instanceproduct.itemscart[index1].image ?? "",
              width: MediaQuery.of(context).size.height * 0.2),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instanceproduct.itemscart[index1].title ?? "",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$ ${instanceproduct.itemscart[index1].price.toString()}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  customoutlinedbutton(
                    cartindex: index1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    instanceproduct
                        .removefromcart(instanceproduct.itemscart[index1]);
                  },
                  icon: Icon(Icons.delete_outline_sharp)),
              customiconbuttonheart(
                //هنا التغيير
                singleproduct: instanceproduct.itemscart[index1],
              )
            ],
          )
        ],
      ),
    );
  }
}
