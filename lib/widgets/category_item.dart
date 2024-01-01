import 'package:appwithfirebase/Provider/products_provider.dart';
import 'package:appwithfirebase/data/models/category_model.dart';
import 'package:appwithfirebase/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class categoryitem extends StatelessWidget {
  const categoryitem({super.key, required this.category});
  final categorymodel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<productsprovider>(context, listen: false)
            .fetchctgproducts(category.name);
        Navigator.pushNamed(context, searchview.id, arguments: category.name);
      },
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.image,
            height: 50,
            width: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
