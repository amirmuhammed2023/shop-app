import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bottomlistprice extends StatelessWidget {
  const bottomlistprice({super.key});

  @override
  Widget build(BuildContext context) {
    final instanceproduct = Provider.of<cartprovider>(context);

    return ListTile(
      title: Text(
        "Total : (${instanceproduct.productsnumber.toString()} product / 6 items)",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      subtitle: Text(
        "${instanceproduct.totalprice.round().toString()} \$",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      trailing: ElevatedButton(onPressed: () {}, child: Text("Checkout")),
    );
  }
}
