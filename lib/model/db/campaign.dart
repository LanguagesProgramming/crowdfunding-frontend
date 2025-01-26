import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:http/http.dart';

class CampaignModelDB extends CampaignModel {
  static final CampaignModelDB _singleton = CampaignModelDB._internal();

  factory CampaignModelDB() {
    return _singleton;
  }

  CampaignModelDB._internal();
}
