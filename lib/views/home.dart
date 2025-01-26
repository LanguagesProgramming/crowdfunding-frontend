import 'package:crowdfunding_frontend/components/campaign.dart';
import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/controllers/campaign_view_model.dart';
import 'package:crowdfunding_frontend/controllers/home_view_model.dart';
import 'package:crowdfunding_frontend/model/local/campaign.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/routes/campaign_route.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  HomeViewModel homeViewModel = HomeViewModel(CampaignModelLocal());

  Home({super.key}) {
    homeViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
            width: screenWidth,
            height: screenHeight * 0.10,
            color: Color(0xFFC1E965),
            child: Center(
                child: Container(
                    width: screenWidth * 0.80,
                    height: screenHeight * 0.08,
                    color: Color(0xFFF7F7F7),
                    padding:
                        EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                    child: Row(spacing: 10, children: [
                      Icon(Icons.search),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What do you want?',
                          border: InputBorder.none,
                        ),
                      )),
                    ])))),
        Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: screenWidth * 0.80,
            child: Text(
              'Choose By Category',
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )),
        SizedBox(
          width: screenWidth * 0.80,
          child: ListenableBuilder(
              listenable: homeViewModel,
              builder: (BuildContext context, Widget? child) {
                return Wrap(
                  spacing: 20,
                  children:
                      List.generate(homeViewModel.categories.length, (index) {
                    Category currentCategory = homeViewModel.categories[index];
                    return CategoryComponent(
                      label: currentCategory.label,
                      isSelected: currentCategory.isSelected,
                      onTap: () {
                        homeViewModel.selectCategory(index);
                      },
                    );
                  }),
                );
              }),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ListenableBuilder(
                  listenable: homeViewModel,
                  builder: (BuildContext context, Widget? child) {
                    return ListView.builder(
                        itemCount: homeViewModel.campaigns.length,
                        itemBuilder: (context, idx) {
                          Campaign currentCampaign =
                              homeViewModel.campaigns[idx];
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
                                        currentCampaign,
                                      ),
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
        )
      ],
    );
  }
}
