import 'dart:convert';

import 'package:crowdfunding_frontend/model/db/const.dart';
import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/model/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionModelDB extends TransactionModel {
  @override
  Future<List<Transaction>> getAllTransactions(String userId) async {
    String url = Const.url;

    List<Transaction> transactions = [];

    final response = await http.get(Uri.parse('$url/buy/$userId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> transactionsList = data['data'] as List<dynamic>;

      for (final transaction in transactionsList) {
        Transaction finalTransaction = Transaction.fromJson(transaction);
        transactions.add(finalTransaction);
      }
    }
    return transactions;
  }
}
