import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class customalertdialogimage extends StatefulWidget {
  customalertdialogimage({super.key, required this.pickedimage});
  XFile? pickedimage;

  @override
  State<customalertdialogimage> createState() => _customalertdialogimageState();
}

class _customalertdialogimageState extends State<customalertdialogimage> {
  final ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          "Choose option",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
              onPressed: () async {
                widget.pickedimage =
                    await image.pickImage(source: ImageSource.camera);
                setState(() {});
              },
              icon: Icon(Icons.camera),
              label: Text(
                "Camera",
                style: TextStyle(fontSize: 18),
              )),
          TextButton.icon(
              onPressed: () async {
                widget.pickedimage =
                    await image.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              icon: Icon(Icons.image),
              label: Text("Gallery", style: TextStyle(fontSize: 18))),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  widget.pickedimage = null;
                });
                Navigator.pop(context);
              },
              icon: Icon(Icons.remove),
              label: Text("Remove", style: TextStyle(fontSize: 18)))
        ],
      ),
    );
  }
}
