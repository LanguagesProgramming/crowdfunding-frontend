import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/model/transaction_model.dart';

class TransactionModelLocal extends TransactionModel {
  List<Transaction> transactions = [];

  @override
  Future<List<Transaction>> getAllTransactions(String userId) async {
    return transactions;
  }
}
