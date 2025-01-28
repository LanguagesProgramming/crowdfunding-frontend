import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/model/transaction_model.dart';

class TransactionModelLocal extends TransactionModel {
  List<Transaction> transactions = [
    Transaction(
      user: User(userId: "user1", username: "User1", campaigns: ["1", "2"]),
      value: 155.5,
      units: 1,
      product: Product(
          campaignId: "1",
          productId: "1",
          name: "Name1",
          imageUrl: "https://placehold.jp/150x150.png",
          price: 3,
          discount: 0),
    ),
    Transaction(
      user: User(userId: "user2", username: "User2", campaigns: ["1", "2"]),
      value: 155.5,
      units: 1,
      product: Product(
          campaignId: "1",
          productId: "1",
          name: "Name1",
          imageUrl: "https://placehold.jp/150x150.png",
          price: 3,
          discount: 10),
    ),
    Transaction(
      user: User(userId: "user2", username: "User2", campaigns: ["1", "2"]),
      value: 155.5,
      units: 1,
      product: Product(
        campaignId: "1",
        productId: "1",
        name: "Name1",
        imageUrl: "https://placehold.jp/150x150.png",
        price: 10,
        discount: 4,
      ),
    ),
    Transaction(
      user: User(userId: "user2", username: "User2", campaigns: ["1", "2"]),
      value: 155.5,
      units: 1,
      product: Product(
          campaignId: "1",
          productId: "1",
          name: "Name1",
          imageUrl: "https://placehold.jp/150x150.png",
          price: 4,
          discount: 5),
    ),
    Transaction(
      user: User(userId: "user2", username: "User2", campaigns: ["1", "2"]),
      value: 155.5,
      units: 1,
      product: Product(
          campaignId: "1",
          productId: "1",
          name: "Name1",
          imageUrl: "https://placehold.jp/150x150.png",
          price: 4,
          discount: 4),
    ),
  ];

  @override
  Future<List<Transaction>> getAllTransactions() async {
    return transactions;
  }
}
