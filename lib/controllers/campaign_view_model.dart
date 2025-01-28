import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';

class CampaignViewModel extends ChangeNotifier {
  final CampaignModel campaignModel;
  final ProductModel productModel;
  final Campaign campaign;

  CampaignViewModel(this.campaignModel, this.productModel, this.campaign);

  bool isEditable() {
    var campaignId = campaign.campaignId;
    var user = UserManager().user;

    if (user != null && campaignId == user.userId) {
      return true;
    }

    return false;
  }

  Product getProductFromCampaign() {
    return campaign.product;
  }
}
