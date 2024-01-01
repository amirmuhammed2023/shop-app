import 'package:appwithfirebase/Provider/allorders_provider.dart';
import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/Provider/history_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class historyproduct extends StatelessWidget {
  const historyproduct({super.key, required this.oneproduct});
  final Product1 oneproduct;
  @override
  Widget build(BuildContext context) {
    final instancehistoryprovider = Provider.of<historyprovider>(context);
    final instanceallordersprovider = Provider.of<allordersprovider>(context);
    final instancecartprovider = Provider.of<cartprovider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Image.network(
            oneproduct.image ?? "",
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
                        oneproduct.title ?? "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          instancehistoryprovider.removefromhistory(oneproduct);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Price: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${oneproduct.price}\$",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          instancecartprovider.addtocart(oneproduct);
                          instanceallordersprovider.addtoallorders(oneproduct);
                        },
                        icon: Icon(
                          Icons.add_circle_sharp,
                        ))
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
