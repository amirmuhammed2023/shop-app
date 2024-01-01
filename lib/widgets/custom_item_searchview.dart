import 'package:appwithfirebase/Provider/allorders_provider.dart';
import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/Provider/history_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/views/details_view.dart';
import 'package:appwithfirebase/widgets/custom_iconbuttonheart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class customitemsearchview extends StatelessWidget {
  const customitemsearchview({super.key, required this.singleproduct});
  final Product1 singleproduct;
  @override
  Widget build(BuildContext context) {
    final instancecartprovider = Provider.of<cartprovider>(context);
    final instanceallordersprovider = Provider.of<allordersprovider>(context);
    final instancehistoryprovider = Provider.of<historyprovider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, detailsview.id, arguments: singleproduct);
        instancehistoryprovider.addtohistory(singleproduct);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.network(
                singleproduct.image ?? "",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  singleproduct.title ?? "null",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              customiconbuttonheart(
                singleproduct: singleproduct,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${singleproduct.price.toString()} ",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              IconButton(
                  onPressed: () {
                    instancecartprovider.addtocart(singleproduct);
                    instanceallordersprovider.addtoallorders(singleproduct);
                  },
                  icon: Icon(
                    Icons.add_circle_sharp,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
