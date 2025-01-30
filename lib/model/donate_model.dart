import 'dart:convert';

import 'package:crowdfunding_frontend/model/db/const.dart';
import 'package:http/http.dart' as http;

class DonationModel {
  double amount;

  DonationModel({this.amount = 0.0});

  Future<bool> donate(String userId, String campaignId, double amount) async {
    String url = Const.url;

    dynamic body = jsonEncode(
        {'user_id': userId, 'campaign_id': campaignId, 'amount': amount});

    final response = await http.post(Uri.parse('$url/donate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    return response.statusCode == 200;
  }
}

