import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';

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
    return Transaction(
        product: Product.fromJson(json['product']),
        userId: json['user_id'],
        value: json['price'],
        units: json['stock']);
  }
}
