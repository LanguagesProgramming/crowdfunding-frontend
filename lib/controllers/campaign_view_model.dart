import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';

class CampaignViewModel extends ChangeNotifier {
  final CampaignModel campaignModel;
  final ProductModel productModel;
  Campaign campaign;

  CampaignViewModel(this.campaignModel, this.productModel, this.campaign);

  bool isEditable() {
    var campaignUserId = campaign.userId;
    var user = UserManager().user;

    if (user != null && campaignUserId == user.userId) {
      return true;
    }

    return false;
  }

  Product getProductFromCampaign() {
    return campaign.product;
  }

  Future<void> update() async {
    try {
      Campaign newCampaign = await campaignModel.getById(campaign.campaignId);
      campaign = newCampaign;
      notifyListeners();
    } catch (e) {
      print("Error updating campaign");
      print(e);
    }
  }
}
