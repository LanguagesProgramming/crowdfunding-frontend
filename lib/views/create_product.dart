import 'dart:io';

import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateProduct extends StatefulWidget {
  CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  TextEditingController nameController = TextEditingController();
  File? imageFile;
  TextEditingController discountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Color doneColor = Color(0xFFC8C8C8);

  void pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: Padding(
            padding:
                const EdgeInsets.all(16.0), // Add padding for better spacing
            child: Column(children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4, // Left column takes 40% of the width
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6, // Right column takes 60% of the width
                        child: TextField(
                          controller: nameController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Add a photo",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      color: Colors.grey,
                      child: imageFile == null
                          ? Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.image,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.photo_library),
                                              title: const Text(
                                                  'Elegir de galería'),
                                              onTap: () {
                                                pickImage();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          : Image.file(
                              imageFile!,
                              fit: BoxFit.contain,
                            ),
                    )
                  ]),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Discount",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: discountController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Price",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: priceController,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              Expanded(child: Container()),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                color: doneColor,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ])));
  }
}
