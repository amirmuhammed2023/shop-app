import 'package:appwithfirebase/Provider/products_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class customtextfield extends StatefulWidget {
  customtextfield({
    super.key,
    required this.searched,
  });
  List<Product1> searched = [];
  @override
  State<customtextfield> createState() => _customtextfieldState();
}

class _customtextfieldState extends State<customtextfield> {
  late TextEditingController control;
  @override
  void initState() {
    control = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final instanceprovider = Provider.of<productsprovider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        onChanged: (value) {
          instanceprovider.fetchsearchedproducts(control.text);
          widget.searched = instanceprovider.searchedproductsgetter;
        },
        controller: control,
        decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: IconButton(
                onPressed: () {
                  instanceprovider.searchedproductsgetter.clear();
                  print(widget.searched);
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                )),
            prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ))),
      ),
    );
  }
}
