import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/components/product.dart';
import 'package:crowdfunding_frontend/controllers/buy_view_model.dart';
import 'package:crowdfunding_frontend/controllers/campaign_view_model.dart';
import 'package:crowdfunding_frontend/controllers/summary_view_model.dart';
import 'package:crowdfunding_frontend/model/db/campaign.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/model/schema/products.dart';
import 'package:crowdfunding_frontend/model/summary_model.dart';
import 'package:crowdfunding_frontend/views/buy.dart';
import 'package:crowdfunding_frontend/views/donate.dart';
import 'package:crowdfunding_frontend/views/edit_campaign.dart';
import 'package:crowdfunding_frontend/views/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class CampaignRoute extends StatefulWidget {
  final CampaignViewModel campaignViewModel;

  CampaignRoute({super.key, required this.campaignViewModel});

  @override
  _CampaignRouteState createState() => _CampaignRouteState();
}

class _CampaignRouteState extends State<CampaignRoute> {
  late CampaignViewModel campaignViewModel;

  @override
  void initState() {
    super.initState();
    campaignViewModel = widget.campaignViewModel;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MainAppBar(),
      body: ListenableBuilder(
        listenable: campaignViewModel,
        builder: (context, child) {
          Campaign campaign = campaignViewModel.campaign;
          Product product = campaignViewModel.getProductFromCampaign();

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
                      children: [Text(campaignViewModel.campaign.userName)],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(
                                controller: CampaignSummary(SummaryModel(
                                    goalAmount: campaign.goal,
                                    raisedAmount: campaign.currentMoney))),
                          ),
                        );
                      },
                      child: LinearProgressIndicator(
                        color: Color(0xFFC1E965),
                        backgroundColor: Color(0xFF3E4B1F),
                        minHeight: 20,
                        value: campaign.currentMoney / campaign.goal,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
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
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BuyView(campaign: campaignViewModel.campaign),
                    ),
                  );
                  Phoenix.rebirth(context);
                },
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ProductComponent(
                    productUrl: product.imageUrl,
                    productName: product.name,
                    price: product.price,
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              if (campaignViewModel.isEditable()) ...[
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  color: Color(0xFFDD0000),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditCampaign(
                            campaignModel: CampaignModelDB(),
                            campaign: campaign,
                          ),
                        ),
                      );
                      Phoenix.rebirth(context);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ] else ...[
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  color: Color(0xFFC1E965),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
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

                      Phoenix.rebirth(context);
                    },
                    child: Text(
                      'Donate Now',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
