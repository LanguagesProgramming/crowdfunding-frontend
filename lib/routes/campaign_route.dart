import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/controllers/campaign_view_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:flutter/material.dart';

class CampaignRoute extends StatelessWidget {
  CampaignViewModel campaignViewModel;

  CampaignRoute({super.key, required this.campaignViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ListenableBuilder(
        listenable: campaignViewModel,
        builder: (context, child) {
          Campaign campaign = campaignViewModel.campaign;

          return Column(
            children: [
              Image(
                image: NetworkImage(campaign.imageLink),
              ),
              SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    Text(
                      campaign.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(campaign.userId),
                      ],
                    ),
                    LinearProgressIndicator(
                      color: Color(0xFFC1E965),
                      backgroundColor: Color(0xFF3E4B1F),
                      minHeight: 20,
                      value: campaign.currentMoney / campaign.goal,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$' + campaign.currentMoney.toString() + ' raised',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          ' of \$' + campaign.goal.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'About this Campaign',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          campaign.description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                margin: EdgeInsets.all(20),
                color: Color(0xFFC1E965),
                child: GestureDetector(
                  onTap: () {},
                  child: Text('Donate Now'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
