import 'package:crowdfunding_frontend/model/summary_model.dart';
import 'package:flutter/material.dart';

class CampaignSummary extends ChangeNotifier{
  final SummaryModel _campaignSummary;

  CampaignSummary(this._campaignSummary);
  double get raisedAmount => _campaignSummary.raisedAmount;
  double get goalAmount => _campaignSummary.goalAmount;

  double get progress {
    if (_campaignSummary.goalAmount == 0) return 0.0;
    return _campaignSummary.raisedAmount / _campaignSummary.goalAmount;
  }

  void updateRaisedAmount(double newAmount) {
    _campaignSummary.raisedAmount = newAmount;
    notifyListeners();
  }
}