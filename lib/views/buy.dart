import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/controllers/buy_view_model.dart';
import 'package:crowdfunding_frontend/model/db/transaction.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:flutter/material.dart';

class BuyView extends StatelessWidget {
  late BuyViewModel transactionViewModel;
  Campaign campaign;

  BuyView({super.key, required this.campaign}) {
    transactionViewModel = BuyViewModel(
        transactionModel: TransactionModelDB(), campaign: campaign);
  }

  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: Padding(
            padding:
                const EdgeInsets.all(16.0), // Add padding for better spacing
            child: Column(children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4, // Left column takes 40% of the width
                        child: Text(
                          "Stock",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6, // Right column takes 60% of the width
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: amount,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              )),
              Expanded(child: Container()),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                color: Color(0xFFC1E965),
                child: GestureDetector(
                  onTap: () {
                    transactionViewModel.buy(amount.text);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Buy',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ])));
  }
}
