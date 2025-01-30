import 'dart:convert';
import 'dart:io';
import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:crowdfunding_frontend/model/transaction_model.dart';
import 'package:crowdfunding_frontend/model/db/const.dart';
import 'package:http/http.dart' as http;

class TransactionModelDB extends TransactionModel {
  String url = Const.url;

  TransactionModelDB();

  @override
  Future<List<Transaction>> getAllTransactions() async {
    String user_id =UserManager().user!.userId;
    final response = await http.get(Uri.parse('$url/buy/$user_id'));
    List<Transaction> transactions = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> transactionList = data['data'] as List<dynamic>;
      List<Transaction> transactions = [];
      for (final transaction in transactionList) {
        Transaction finalTransaction = Transaction.fromJson(transaction);
        transactions.add(finalTransaction);
      }
    }
    return transactions;
  }
}
