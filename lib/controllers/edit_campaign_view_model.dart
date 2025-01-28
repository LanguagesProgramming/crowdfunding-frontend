import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:flutter/material.dart';

class EditCampaignViewModel extends ChangeNotifier {
  final CampaignModel campaignModel;
  final Campaign campaign;
  TextEditingController titleController = TextEditingController();
  String category = '';
  TextEditingController descriptionController = TextEditingController();

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

  EditCampaignViewModel({required this.campaignModel, required this.campaign}) {
    titleController.text = campaign.title;
    descriptionController.text = campaign.description;

    for (final Category category in categories) {
      if (category.label == campaign.category) {
        category.isSelected = true;
      }
    }
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
  }

  void update() {}
}
