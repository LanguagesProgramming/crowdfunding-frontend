import 'package:crowdfunding_frontend/model/schema/campaigns.dart';

abstract class CampaignModel {
  Future<List<Campaign>> getAll();

  Future<Campaign> getById(String id);
}
