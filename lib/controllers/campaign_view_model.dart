import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:flutter/material.dart';

class CampaignViewModel extends ChangeNotifier {
  final CampaignModel model;
  final Campaign campaign;

  CampaignViewModel(this.model, this.campaign);

  Future<void> init() async {}
}
