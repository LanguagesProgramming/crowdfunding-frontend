import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';

class CampaignViewModel extends ChangeNotifier {
  final CampaignModel campaignModel;
  final Campaign campaign;

  CampaignViewModel(this.campaignModel, this.campaign);

  bool isEditable() {
    var campaignId = campaign.campaignId;
    var user = UserManager().user;

    if (user != null && campaignId == user.userId) {
      return true;
    }

    return false;
  }
}
