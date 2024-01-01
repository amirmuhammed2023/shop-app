import 'package:appwithfirebase/Provider/theme_provider.dart';
import 'package:appwithfirebase/constants/appconstant.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class swiperpackage extends StatelessWidget {
  const swiperpackage({super.key});

  @override
  Widget build(BuildContext context) {
    final classinstance = Provider.of<themeprovider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                appconstant.bannerimage[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: 2,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    activeColor:
                        classinstance.isdark ? Colors.red : Colors.black)),
          ),
        ),
      ),
    );
  }
}
