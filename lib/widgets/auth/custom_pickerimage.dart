import 'dart:io';

import 'package:appwithfirebase/widgets/auth/custom_alertdialogimage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class custompickerimage extends StatelessWidget {
  custompickerimage({super.key, required this.pickedimage});
  XFile? pickedimage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: pickedimage == null
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all()),
                    )
                  : Image.file(
                      File(pickedimage!.path),
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Positioned(
            right: -15,
            top: -15,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.blue.shade100,
              child: IconButton(
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return customalertdialogimage(
                            pickedimage: pickedimage,
                          );
                        });
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
