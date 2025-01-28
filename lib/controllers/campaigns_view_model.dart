import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';

class CampaignsViewModel extends ChangeNotifier {
  final CampaignModel campaignModel;

  CampaignsViewModel(this.campaignModel);

  List<Campaign> campaigns = [];

  Future<void> init() async {
    try {
      List<Campaign> fetchedCampaings = await campaignModel.getAll();

      for (final campaign in fetchedCampaings) {
        var user = UserManager().user;
        if (user != null && campaign.userId == user.userId) {
          campaigns.add(campaign);
        }
      }

      notifyListeners();
    } catch (e) {}
  }
}
