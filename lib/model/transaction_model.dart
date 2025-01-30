import 'package:crowdfunding_frontend/model/schema/transaction.dart';

abstract class TransactionModel {
  Future<List<Transaction>> getAllTransactions(String userId);
}
