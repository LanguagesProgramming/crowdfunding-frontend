import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';

class Transaction {
  Product product;
  User user;
  double value;
  int units;

  Transaction(
      {required this.product,
      required this.user,
      required this.value,
      required this.units});
}
