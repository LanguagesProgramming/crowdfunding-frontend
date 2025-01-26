import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/controllers/summary_view_model.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget{
  final CampaignSummary controller;
  const Summary({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: controller, 
          builder: (context, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$ ${controller.raisedAmount.toStringAsFixed(2)} raised", 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                LinearProgressIndicator(
                  value: controller.progress,
                  backgroundColor: Colors.grey[300],
                  color: Colors.lightGreen,
                ),
                SizedBox(height: 8),
                Text("of \$ ${controller.goalAmount.toStringAsFixed(2)}")
              ],
            );
          }
        ),
      )
    );
    
  }
  
}