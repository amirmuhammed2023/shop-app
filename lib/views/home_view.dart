import 'package:appwithfirebase/widgets/custom_appbar.dart';
import 'package:appwithfirebase/widgets/section_categories.dart';
import 'package:appwithfirebase/widgets/section_latestarrival.dart';
import 'package:appwithfirebase/widgets/swiper_package.dart';
import 'package:flutter/material.dart';

class homeview extends StatelessWidget {
  const homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customappbar(title: "Shop Smart"),
            swiperpackage(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            sectionlatestarrival(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            sectioncategories(),
          ],
        ),
      ),
    );
  }
}
