import 'package:flutter/material.dart';

class CampaignComponent extends StatelessWidget {
  String campaignId;
  String userId;
  String title;
  String imageUrl;
  double goal;
  double currentMoney;
  int timeLeft;
  Function() onTap;

  CampaignComponent({
    super.key,
    required this.campaignId,
    required this.userId,
    required this.title,
    required this.imageUrl,
    required this.goal,
    required this.currentMoney,
    required this.timeLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(
              image: NetworkImage(
            imageUrl,
          )),
          Row(
            children: [
              Text(
                'unicef',
                textAlign: TextAlign.left,
              )
            ],
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          LinearProgressIndicator(
            color: Color(0xFFC1E965),
            backgroundColor: Color(0xFF3E4B1F),
            minHeight: 20,
            value: currentMoney / goal,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$$currentMoney'),
              Text('$timeLeft days left'),
            ],
          )
        ],
      ),
    );
  }
}
