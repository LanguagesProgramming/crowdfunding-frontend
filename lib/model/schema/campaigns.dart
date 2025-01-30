import 'package:crowdfunding_frontend/model/schema/products.dart';

class Campaign {
  final String campaignId;
  final Product product;
  final String userId;
  final String userName;
  final String title;
  final String category;
  final String description;
  final double goal;
  final double currentMoney;
  final String imageLink;

  Campaign({
    required this.campaignId,
    required this.product,
    required this.userId,
    required this.userName,
    required this.title,
    required this.category,
    required this.description,
    required this.goal,
    required this.currentMoney,
    required this.imageLink,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    String domain = 'https://mysite-f0j9.onrender.com';
    String finalImageLink = domain + '/' + json['images'][0];

    if (json.containsKey('campaign_id') &&
        json.containsKey('user_id') &&
        json.containsKey('title') &&
        json.containsKey('category') &&
        json.containsKey('description') &&
        json.containsKey('goal') &&
        json.containsKey('current_money') &&
        json.containsKey('images') &&
        json['images'] is List) {
      return Campaign(
        campaignId: json['campaign_id'],
        product: Product.fromJson(json['product']),
        userName: 'random',
        userId: json['user_id'],
        title: json['title'],
        category: json['category'],
        description: json['description'],
        goal: (json['goal'] as num).toDouble(),
        currentMoney: (json['current_money'] as num).toDouble(),
        imageLink: (json['images'] as List).isNotEmpty ? finalImageLink : '',
      );
    } else {
      throw const FormatException("Failed to load Campaign");
    }
  }
}
