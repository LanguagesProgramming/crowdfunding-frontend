import 'package:crowdfunding_frontend/model/schema/products.dart';

class Campaign {
  final String campaignId;
  final String userId;
  final String userName;
  final String title;
  final String category;
  final String description;
  final Product product;
  final double goal;
  final double currentMoney;
  final String imageLink;

  Campaign({
    required this.campaignId,
    required this.userId,
    required this.userName,
    required this.title,
    required this.category,
    required this.description,
    required this.product,
    required this.goal,
    required this.currentMoney,
    required this.imageLink,
  });
}
