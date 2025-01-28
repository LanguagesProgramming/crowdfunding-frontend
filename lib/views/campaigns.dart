import 'package:crowdfunding_frontend/components/campaign.dart';
import 'package:crowdfunding_frontend/controllers/campaign_view_model.dart';
import 'package:crowdfunding_frontend/controllers/campaigns_view_model.dart';
import 'package:crowdfunding_frontend/model/local/campaign.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/views/campaign_route.dart';
import 'package:flutter/material.dart';

class CampaignsView extends StatelessWidget {
  CampaignsViewModel campaignsViewModel =
      CampaignsViewModel(CampaignModelLocal());

  CampaignsView({super.key}) {
    campaignsViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ListenableBuilder(
                  listenable: campaignsViewModel,
                  builder: (BuildContext context, Widget? child) {
                    return ListView.builder(
                        itemCount: campaignsViewModel.campaigns.length,
                        itemBuilder: (context, idx) {
                          Campaign currentCampaign =
                              campaignsViewModel.campaigns[idx];
                          return Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: CampaignComponent(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CampaignRoute(
                                      campaignViewModel: CampaignViewModel(
                                          CampaignModelLocal(),
                                          currentCampaign),
                                    ),
                                  ),
                                );
                              },
                              campaignId: currentCampaign.campaignId,
                              userId: currentCampaign.userId,
                              userName: currentCampaign.userName,
                              title: currentCampaign.title,
                              imageUrl: currentCampaign.imageLink,
                              goal: currentCampaign.goal,
                              currentMoney: currentCampaign.currentMoney,
                              timeLeft: 20,
                            ),
                          );
                        });
                  }),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          color: Color(0xFFC1E965),
          child: GestureDetector(
            onTap: () {
              /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonateView(
                          campaignTitle:
                              campaign.title, // Pasamos datos relevantes
                          campaignId: campaign
                              .campaignId, // Si tienes un ID de la campaña
                        ),
                      ),
                    );
                    */
            },
            child: Text(
              'Create Campaign',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
