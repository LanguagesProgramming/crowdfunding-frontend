import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/model/transaction_model.dart';
import 'package:crowdfunding_frontend/session.dart';

class BuyViewModel {
  TransactionModel transactionModel;
  Campaign campaign;

  BuyViewModel({required this.transactionModel, required this.campaign});

  Future<void> buy(String amount) async {
    var user = UserManager().user;

    if (user != null) {
      String userId = user.userId;
      String campaignId = campaign.campaignId;
      await transactionModel.buy(campaignId, userId, double.parse(amount));
    }
  }
}
