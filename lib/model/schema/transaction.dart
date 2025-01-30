import 'package:crowdfunding_frontend/model/schema/products.dart';

class Transaction {
  Product product;
  String userId;
  int units;
  double value;

  Transaction(
      {required this.product,
      required this.userId,
      required this.value,
      required this.units});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('product') &&
        json.containsKey('user_id') &&
        json.containsKey('stock') &&
        json.containsKey('price')) {
      return Transaction(
          product: Product.fromJson(json['product']),
          userId: json['user_id'],
          units: json['stock'],
          value: json['price']);
    } else {
      throw const FormatException("Failed to load Campaign");
    }
  }
}
