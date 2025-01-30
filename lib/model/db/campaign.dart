import 'dart:convert';
import 'dart:io';

import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/db/const.dart';
import 'package:crowdfunding_frontend/model/db/help.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:http/http.dart' as http;

class CampaignModelDB extends CampaignModel {
  @override
  Future<List<Campaign>> getAll() async {
    String url = Const.url;
    List<Campaign> campaigns = [];

    final response = await http.get(Uri.parse('$url/campaign'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> campaignList = data['data'] as List<dynamic>;

      for (final campaign in campaignList) {
        Campaign finalCampaign = Campaign.fromJson(campaign);
        campaigns.add(finalCampaign);
      }
    }

    return campaigns;
  }

  @override
  Future<Campaign> getById(String id) async {
    String url = Const.url;

    final response = await http.get(Uri.parse('$url/campaign/$id'));

    if (response.statusCode == 200) {
      final body = response.body;
      Map<String, dynamic> data = jsonDecode(body) as Map<String, dynamic>;
      return Campaign.fromJson(data['data']);
    }

    throw Exception("Not found");
  }

  @override
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
      File prodImage) async {
    String url = Const.url;

    String campaignImage = await ImageToBase64.convert(image);
    String productImage = await ImageToBase64.convert(prodImage);

    dynamic body = jsonEncode({
      'user_id': userId,
      'title': title,
      'category': category.toUpperCase(),
      'description': description,
      'product': {
        'name': productName,
        'price': productPrice,
        'discount': productDiscount,
        'images': [productImage]
      },
      'goal': goal,
      'images': [campaignImage]
    });

    final response = await http.post(Uri.parse('$url/campaign'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    return response.statusCode == 200;
  }

  @override
  Future<bool> updateCampaign(String campaignId, String? newTitle,
      String? newCategory, String? newDescription) async {
    String url = Const.url;

    Map<String, String> newData = {
      'campaign_id': campaignId,
    };

    if (newTitle != null) {
      newData['title'] = newTitle;
    }

    if (newCategory != null) {
      newData['category'] = newCategory.toUpperCase();
    }

    if (newDescription != null) {
      newData['description'] = newDescription;
    }

    dynamic body = jsonEncode(newData);

    final response = await http.put(Uri.parse('$url/campaign'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    print(jsonDecode(response.body));

    return response.statusCode == 200;
  }
}
