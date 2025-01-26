import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/model/transaction_model.dart';

class TransactionModelLocal extends TransactionModel {
  List<Transaction> transactions = [
    Transaction(
        user: User(
          userId: "user1",
          username: "User1",
          campaigns: ["1", "2"] 
        ),
        value: 155.5,
        units: 1,
        product: Product(
            campaignId: "1",
            productId: "1",
            name: "Name1",
            imageUrl: "https://placehold.jp/150x150.png"
            ),
    ),
    Transaction(
        user: User(
          userId: "user2",
          username: "User2",
          campaigns: ["1", "2"] 
        ),
        value: 155.5,
        units: 1,
        product: Product(
            campaignId: "1",
            productId: "1",
            name: "Name1",
            imageUrl: "https://placehold.jp/150x150.png"
            ),
    ),

  ];

  @override
  Future<List<Transaction>> getAllTransactions() async {
    return transactions;
  }
}
