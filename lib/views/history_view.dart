import 'package:appwithfirebase/Provider/history_provider.dart';
import 'package:appwithfirebase/constants/appconstant.dart';
import 'package:appwithfirebase/widgets/empty_bag.dart';
import 'package:appwithfirebase/widgets/profile%20general%20list/history_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class historyview extends StatelessWidget {
  const historyview({super.key});
  static const id = "/historyview";
  @override
  Widget build(BuildContext context) {
    final instancehistoryprovider = Provider.of<historyprovider>(context);
    return instancehistoryprovider.historylist.isEmpty
        ? Scaffold(
            body: emptybag(
            image: appconstant.emptyhistory,
            title: "No History",
            subtitle:
                "Looks like you don\'t watch any product go to shop and watch products",
          ))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "History (${instancehistoryprovider.historylist.length})",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return historyproduct(
                    oneproduct: instancehistoryprovider.historylist[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: instancehistoryprovider.historylist.length),
          );
  }
}
