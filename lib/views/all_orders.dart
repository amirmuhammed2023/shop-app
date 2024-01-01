import 'package:appwithfirebase/Provider/allorders_provider.dart';
import 'package:appwithfirebase/constants/appconstant.dart';
import 'package:appwithfirebase/widgets/empty_bag.dart';
import 'package:appwithfirebase/widgets/profile%20general%20list/placesorders_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class allorders extends StatelessWidget {
  const allorders({super.key});
  static const id = "/allorders";
  @override
  Widget build(BuildContext context) {
    final instanceallordersprovider = Provider.of<allordersprovider>(context);

    return instanceallordersprovider.allorderslist.isEmpty
        ? Scaffold(
            body: emptybag(
            image: appconstant.emptyorders,
            title: "There are no previous orders",
            subtitle:
                "Looks like you don\'t add any thing to your cart go ahead of explore top categories",
          ))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Placed orders (${instanceallordersprovider.allorderslist.length})",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return placedordersproduct(
                    oneproduct: instanceallordersprovider.allorderslist[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: instanceallordersprovider.allorderslist.length),
          );
  }
}
