import 'package:flutter/material.dart';
import '../model/donate_model.dart';

class DonationController extends ChangeNotifier {
  final DonationModel _donationModel;

  DonationController(this._donationModel);

  double get amount => _donationModel.amount;

  void updateAmount(double newAmount) {
    _donationModel.amount += newAmount;
    notifyListeners();
  }

  bool validateAmount() {
    return _donationModel.amount > 0;
  }

  void submitDonation(BuildContext context) {
    if (validateAmount()) {
      // Aquí puedes añadir lógica para enviar la donación al servidor
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Donation of \$${_donationModel.amount} successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid amount')),
      );
    }
  }
}
