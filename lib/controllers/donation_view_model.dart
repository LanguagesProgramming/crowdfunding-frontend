import 'package:crowdfunding_frontend/model/donate_model.dart';
import 'package:crowdfunding_frontend/model/schema/user.dart';
import 'package:crowdfunding_frontend/session.dart';
import 'package:flutter/material.dart';

class DonationController extends ChangeNotifier {
  final DonationModel _donationModel;
  late String campaignId;

  DonationController(this._donationModel);

  double get amount => _donationModel.amount;

  void updateAmount(double newAmount) {
    _donationModel.amount = newAmount;
    notifyListeners();
  }

  bool validateAmount() {
    return _donationModel.amount > 0;
  }

  Future<void> submitDonation(BuildContext context) async {
    User? user = UserManager().user;
    bool res = false;

    if (!validateAmount()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid amount')),
      );
    }

    if (user != null) {
      String userId = user.userId;

      // Aquí puedes añadir lógica para enviar la donación al servidor
      res = await _donationModel.donate(userId, campaignId, amount);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid user')),
      );
    }

    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Donation of \$${_donationModel.amount} successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not donate')),
      );
    }
  }
}
