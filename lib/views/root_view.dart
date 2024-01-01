import 'package:appwithfirebase/Provider/cart_provider.dart';
import 'package:appwithfirebase/views/cart_view.dart';
import 'package:appwithfirebase/views/home_view.dart';
import 'package:appwithfirebase/views/profile_view.dart';
import 'package:appwithfirebase/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class rootview extends StatefulWidget {
  const rootview({super.key});
  static const id = "/rootview";

  @override
  State<rootview> createState() => _rootviewState();
}

class _rootviewState extends State<rootview> {
  late PageController control;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    control = PageController(initialPage: currentpage);
  }

  @override
  Widget build(BuildContext context) {
    final instanceproduct = Provider.of<cartprovider>(context);
    String number = instanceproduct.productsnumber.toString();
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: control,
        children: [
          homeview(),
          searchview(),
          cartview(),
          profileview(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        height: kBottomNavigationBarHeight,
        selectedIndex: currentpage,
        onDestinationSelected: (chosen) {
          setState(() {
            currentpage = chosen;
            control.jumpToPage(currentpage);
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(
              icon: Badge(label: Text(number), child: Icon(Icons.shop_rounded)),
              label: "Cart"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
