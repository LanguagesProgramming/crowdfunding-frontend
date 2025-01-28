import 'package:crowdfunding_frontend/controllers/create_campaign_view_model.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:flutter/material.dart';

class CreateCampaign extends StatefulWidget {
  CampaignModel campaignModel;
  ProductModel productModel;

  CreateCampaign(
      {super.key, required this.campaignModel, required this.productModel});

  @override
  State<StatefulWidget> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  late CreateCampaignViewModel createCampaignViewModel;

  @override
  void initState() {
    createCampaignViewModel =
        CreateCampaignViewModel(widget.campaignModel, widget.productModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
