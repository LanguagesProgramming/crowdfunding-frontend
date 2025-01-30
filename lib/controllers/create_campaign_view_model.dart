import 'dart:ffi';
import 'dart:io';

import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCampaignViewModel extends ChangeNotifier {
  CampaignModel campaignModel;
  ProductModel productModel;
  Color doneColor = Color(0xFFC8C8C8);
  Color productColor = Color(0xFFC1E965);
  File? imageFile;
  dynamic product;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String category = '';
  TextEditingController goalController = TextEditingController();

  void readyToCreate() {
    bool ready = titleController.text != '' &&
        descriptionController != '' &&
        goalController != '' &&
        category != '' &&
        imageFile != null;

    if (ready) {
      doneColor = Color(0xFFC1E965);
      notifyListeners();
    }
  }

  List<Category> categories = [
    Category(label: 'Technology', isSelected: false),
    Category(label: 'Art', isSelected: false),
    Category(label: 'Fahsion', isSelected: false)
  ];

  void selectCategory(int index) {
    for (int i = 0; i < categories.length; i++) {
      if (i != index) {
        categories[i].isSelected = false;
      }
    }
    categories[index].isSelected = !categories[index].isSelected;
    category = categories[index].label;
    notifyListeners();
  }

  CreateCampaignViewModel(this.campaignModel, this.productModel);

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
  }

  void pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }

    notifyListeners();
  }

  void disableAddProduct() {
    productColor = Color(0xFFC8C8C8);
    notifyListeners();
  }

  void setProduct(dynamic createdProduct) {
    product = createdProduct;
  }

  Future<void> createCampaign() async {
    User? user = UserManager().user;
    String userId;
    if (user != null) {
      userId = user.userId;
    } else {
      userId = '1';
    }

    bool res = await campaignModel.createCampaign(
        userId,
        titleController.text,
        category,
        descriptionController.text,
        double.parse(goalController.text),
        imageFile ?? File(''),
        product['name'],
        double.parse(product['price']),
        double.parse(product['discount']),
        product['imageFile']);
  }
}
