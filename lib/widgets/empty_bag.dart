import 'package:appwithfirebase/views/search_view.dart';
import 'package:flutter/material.dart';

class emptybag extends StatelessWidget {
  const emptybag(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title});
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
          ),
          Text(
            "Whoops!",
            style: TextStyle(
                color: Colors.red, fontSize: 40, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, searchview.id);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Shop now",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ))
        ],
      ),
    );
  }
}
