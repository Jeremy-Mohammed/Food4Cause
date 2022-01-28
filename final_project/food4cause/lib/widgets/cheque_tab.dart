import 'dart:io';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ChequeTab extends StatefulWidget {
  const ChequeTab({Key? key}) : super(key: key);

  @override
  State<ChequeTab> createState() => _ChequeTabState();
}

class _ChequeTabState extends State<ChequeTab> {
  File? image;
  File? image2;
  Future pickImageFront() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed to pick iamge:$e");
    }
  }

  Future pickImageBack() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image2!.path);
    setState(() {
      this.image2 = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Cheque"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
            child: Center(child: Text("Front of Cheque")),
          ),
          Center(
            child: Container(
              height: 150,
              width: 300,
              color: Colors.grey[100],
              child: image != null
                  ? Image.file(
                      image!,
                      fit: BoxFit.cover,
                    )
                  : Center(child: Text("Nothing Selected")),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => pickImageFront(),
              child: Text("Choose from gallery"),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(child: Text("Back of Cheque")),
          ),
          Center(
            child: Container(
              height: 150,
              width: 300,
              color: Colors.grey[100],
              child: image2 != null
                  ? Image.file(
                      image2!,
                      fit: BoxFit.cover,
                    )
                  : Center(child: Text("Nothing Selected")),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => pickImageBack(),
              child: Text("Choose from gallery"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      image = null;
                      image2 = null;
                    });
                  },
                  child: Text(
                    "Submit Cheque",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
