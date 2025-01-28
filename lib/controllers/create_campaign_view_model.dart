import 'dart:io';

import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCampaignViewModel extends ChangeNotifier {
  CampaignModel campaignModel;
  ProductModel productModel;
  Color doneColor = Color(0xFFC8C8C8);
  File? imageFile;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String category = '';
  TextEditingController goalController = TextEditingController();

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
}
