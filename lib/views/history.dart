import 'package:flutter/material.dart';
import 'package:crowdfunding_frontend/controllers/history_view_model.dart';
import 'package:crowdfunding_frontend/model/db/transaction.dart';
import 'package:crowdfunding_frontend/model/schema/transaction.dart';
import 'package:crowdfunding_frontend/components/transaction.dart';

class History extends StatelessWidget {
  HistoryViewModel historyViewModel = HistoryViewModel(TransactionModelDB());

  History({super.key}) {
    historyViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(children: [
      Expanded(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: ListenableBuilder(
              listenable: historyViewModel,
              builder: (BuildContext context, Widget? child) {
                return ListView.builder(
                  itemCount: historyViewModel.transactions.length,
                  itemBuilder: (context, idx) {
                    Transaction currentTransaction =
                        historyViewModel.transactions[idx];
                    return Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: TransactionComponent(
                        name: currentTransaction.product.name,
                        imageUrl: currentTransaction.product.imageUrl,
                        campaignName: currentTransaction.product.campaignId,
                        value: currentTransaction.value,
                        units: currentTransaction.units,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      )
    ]);
  }
}

