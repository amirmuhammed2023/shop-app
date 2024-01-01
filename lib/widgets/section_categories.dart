import 'package:appwithfirebase/constants/appconstant.dart';
import 'package:appwithfirebase/widgets/category_item.dart';
import 'package:flutter/material.dart';

class sectioncategories extends StatelessWidget {
  const sectioncategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: appconstant.categories.length,
                itemBuilder: (context, index) {
                  return categoryitem(category: appconstant.categories[index]);
                },
              ),
              /*GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    appconstant.categories.length,
                    (index) => categoryitem(
                          category: appconstant.categories[index],
                        )),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
