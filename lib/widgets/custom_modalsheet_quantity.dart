import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class custommodalsheetquantity extends StatelessWidget {
  const custommodalsheetquantity({super.key, required this.cartindex});
  final int cartindex;
  @override
  Widget build(BuildContext context) {
    final instanceproduct = Provider.of<cartprovider>(context);

    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 5,
          indent: 170,
          endIndent: 170,
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      instanceproduct.quantityfunction(
                          instanceproduct.itemscart[cartindex], index + 1);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "${index + 1}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ));
              }),
        ),
      ],
    );
  }
}
