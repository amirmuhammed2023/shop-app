import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/Provider/products_provider.dart';
import 'package:appwithfirebase/widgets/latestarrival_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class sectionlatestarrival extends StatefulWidget {
  const sectionlatestarrival({super.key});

  @override
  State<sectionlatestarrival> createState() => _sectionlatestarrivalState();
}

class _sectionlatestarrivalState extends State<sectionlatestarrival> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<productsprovider>(context, listen: false).fetchallproducts();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final instanceprovider = Provider.of<productsprovider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest arrival",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: instanceprovider.allproductsgetter.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return latestarrivalitem(
                      latestproduct: instanceprovider.allproductsgetter[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
