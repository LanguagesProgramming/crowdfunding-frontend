import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/model/user_model.dart';
import 'package:flutter/material.dart';

class CampaignViewModel extends ChangeNotifier {
  final CampaignModel campaignModel;
  final Campaign campaign;

  CampaignViewModel(this.campaignModel, this.campaign);
}
