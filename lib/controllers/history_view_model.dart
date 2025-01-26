import "package:crowdfunding_frontend/model/transaction_model.dart";
import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:flutter/material.dart';

class HistoryViewModel extends ChangeNotifier{
  final TransactionModel model;

  List<Transaction> transactions = [];

  HistoryViewModel(this.model);

  Future<void> init() async {
    try {
      List<Transaction> fetchedTransactions = await model.getAllTransactions();
      transactions.addAll(fetchedTransactions);
      notifyListeners();
    } catch (e) {}
  }
}