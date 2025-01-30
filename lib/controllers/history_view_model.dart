import 'package:crowdfunding_frontend/model/schema/user.dart';
import "package:crowdfunding_frontend/model/transaction_model.dart";
import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';

class HistoryViewModel extends ChangeNotifier {
  final TransactionModel model;

  List<Transaction> transactions = [];

  HistoryViewModel(this.model);

  Future<void> init() async {
    User? user = UserManager().user;
    String userId = '';

    if (user != null) {
      userId = user.userId;
    }

    try {
      transactions.clear();
      List<Transaction> fetchedTransactions =
          await model.getAllTransactions(userId);
      transactions.addAll(fetchedTransactions);
      notifyListeners();
    } catch (e) {
      print("Errow showing transactions");
      print(e);
    }
  }
}

