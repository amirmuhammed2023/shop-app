import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/widgets/custom_modalsheet_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class customoutlinedbutton extends StatelessWidget {
  const customoutlinedbutton({super.key, required this.cartindex});
  final int cartindex;
  @override
  Widget build(BuildContext context) {
    final instanceproduct = Provider.of<cartprovider>(context);

    return OutlinedButton.icon(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return custommodalsheetquantity(cartindex: cartindex);
              });
        },
        icon: Icon(Icons.arrow_drop_down),
        label: Text("Qty ${instanceproduct.itemscart[cartindex].quantity}"));
  }
}
