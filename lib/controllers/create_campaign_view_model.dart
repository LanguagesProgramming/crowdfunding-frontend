import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:flutter/material.dart';

class CreateCampaignViewModel extends ChangeNotifier {
  CampaignModel campaignModel;
  ProductModel productModel;

  CreateCampaignViewModel(this.campaignModel, this.productModel);
}
