import 'package:appwithfirebase/Provider/wishlist_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class customiconbuttonheart extends StatefulWidget {
  const customiconbuttonheart(
      {super.key,
      this.size = 24,
      this.materialcolors = Colors.transparent,
      required this.singleproduct});
  final double size;
  final Color materialcolors;
  final Product1 singleproduct;

  @override
  State<customiconbuttonheart> createState() => _customiconbuttonheartState();
}

class _customiconbuttonheartState extends State<customiconbuttonheart> {
  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    final instanceprovider = Provider.of<wishlistprovider>(context);
    return Material(
      shape: CircleBorder(),
      color: widget.materialcolors,
      child: IconButton(
          onPressed: () {
            /*setState(() {
              istrue = !istrue;
            });
            if (istrue == true) {
              instanceprovider.addwish(widget.singleproduct);
            } else {
              instanceprovider.removewish(widget.singleproduct);
            }*/
            //instanceprovider.addtowishlist(widget.singleproduct, istrue);
            //instanceprovider.functionsolveproblem(widget.singleproduct);
            instanceprovider.functionsolveproblem(widget.singleproduct);
            print(instanceprovider.wishlist);
          },
          icon: Icon(
            widget.singleproduct.loveit == false
                ? Icons.favorite_border_outlined
                : Icons.favorite,
            color: Colors.red,
            size: widget.size,
          )),
    );
  }
}
