import 'package:flutter/material.dart';
import '../controllers/donation_view_model.dart';
import '../model/donate_model.dart';

class DonateScreen extends StatelessWidget {
  final DonationController donationController = DonationController(DonationModel());

  DonateScreen({super.key, required String campaignTitle, required campaignId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campaign"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Donate Now",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "\$",
                ),
                onChanged: (value) {
                  double newValue = double.tryParse(value) ?? 0.0;
                  donationController.updateAmount(newValue);
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                donationController.submitDonation(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: Text('Donate Now'),
            ),
          ],
        ),
      ),
    );
  }
}

