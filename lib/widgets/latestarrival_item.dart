import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/widgets/custom_iconbuttonheart.dart';
import 'package:flutter/material.dart';

class latestarrivalitem extends StatelessWidget {
  latestarrivalitem({super.key, required this.latestproduct});
  final Product1 latestproduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.55,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                latestproduct.image ?? "",
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    latestproduct.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle,
                              size: 26,
                            )),
                        customiconbuttonheart(
                          singleproduct: latestproduct,
                          size: 26,
                        )
                      ],
                    ),
                  ),
                  Text(
                    "\$ ${latestproduct.price.toString()}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
