import 'dart:io';

import 'package:crowdfunding_frontend/model/schema/campaigns.dart';

abstract class CampaignModel {
  Future<List<Campaign>> getAll();

  Future<Campaign> getById(String id);

  Future<bool> createCampaign(
      String userId,
      String title,
      String category,
      String description,
      double goal,
      File image,
      String productName,
      double productPrice,
      double productDiscount,
      File prodImage);

  Future<bool> updateCampaign(String campaignId, String? newTitle,
      String? newCategory, String? newDescription);
}
