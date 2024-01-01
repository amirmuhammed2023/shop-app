import 'package:appwithfirebase/Provider/products_provider.dart';
import 'package:appwithfirebase/data/models/product1/product1.dart';
import 'package:appwithfirebase/widgets/custom_appbar.dart';
import 'package:appwithfirebase/widgets/custom_item_searchview.dart';
import 'package:appwithfirebase/widgets/custom_textfield.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class searchview extends StatefulWidget {
  const searchview({super.key});
  static const id = "/searchview";

  @override
  State<searchview> createState() => _searchviewState();
}

class _searchviewState extends State<searchview> {
  late TextEditingController control;
  @override
  void initState() {
    control = TextEditingController();
    Future.delayed(Duration.zero, () {
      Provider.of<productsprovider>(context, listen: false).fetchallproducts();
    });
    super.initState();
  }

  void dispose() {
    control.dispose();
    super.dispose();
  }

  List<Product1> listofsearch = [];
  Widget build(BuildContext context) {
    final instanceproduct = Provider.of<productsprovider>(context);
    String? getctg = ModalRoute.of(context)!.settings.arguments as String?;

    List<Product1> listofproduct = getctg == null
        ? instanceproduct.allproductsgetter
        : instanceproduct.ctgproductsgetter;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          customappbar(title: "Store products"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Visibility(
              visible: getctg == null ? true : false,
              child: TextField(
                onChanged: (value) {
                  instanceproduct.fetchsearchedproducts(control.text);
                  listofsearch = instanceproduct.searchedproductsgetter;

                  // listofsearch =  instanceproduct.fetchsearchedproducts(control.text);
                  //instanceproduct.searchedproductsgetter;
                },
                controller: control,
                decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            listofsearch.clear();
                          });
                          control.clear();
                          // print(widget.searched);
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
            ),
          ),
          /* customtextfield(
            searched: instanceproduct.searchedproductsgetter,
          ),*/

          /*   Visibility(
            visible: control.text.isNotEmpty &&
                instanceproduct.searchedproductsgetter.isEmpty,
            child: Center(
              child: Text(
                "Result Not Found",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),*/
          Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: instanceproduct.isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : DynamicHeightGridView(
                        itemCount: listofsearch.isEmpty
                            //control.text.isEmpty
                            //المشكله انو هنا شايفها مش فاضيه فاحنا عاوزين اول ما السيرش يتمسح نفضى الجيتر او نغي الشيك اوبراتور
                            ? listofproduct.length
                            : listofsearch.length,
                        //instanceproduct.searchedproductsgetter.length,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        builder: (ctx, index) {
                          return customitemsearchview(
                              singleproduct: listofsearch.isEmpty
                                  //control.text.isEmpty
                                  //instanceproduct.searchedproductsgetter.isEmpty
                                  ? listofproduct[index]
                                  : listofsearch[index]
                              //instanceproduct.searchedproductsgetter[index]
                              );
                        })),
          )
        ],
      ),
    ));
  }
}
