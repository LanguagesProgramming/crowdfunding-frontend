import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final CampaignModel model;

  List<Category> categories = [
    Category(label: 'Technology', isSelected: false),
    Category(label: 'Art', isSelected: false),
    Category(label: 'Fahsion', isSelected: false)
  ];

  List<Campaign> campaigns = [];

  HomeViewModel(this.model);

  Future<void> init() async {
    campaigns.clear();
    try {
      List<Campaign> fetchedCampaings = await model.getAll();
      campaigns.addAll(fetchedCampaings);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void selectCategory(int index) {
    for (int i = 0; i < categories.length; i++) {
      if (i != index) {
        categories[i].isSelected = false;
      }
    }
    categories[index].isSelected = !categories[index].isSelected;
    notifyListeners();
  }
}
