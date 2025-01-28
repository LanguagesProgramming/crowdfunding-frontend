import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/controllers/edit_campaign_view_model.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:flutter/material.dart';

class EditCampaign extends StatefulWidget {
  final CampaignModel campaignModel;
  final Campaign campaign;

  EditCampaign({
    super.key,
    required this.campaignModel,
    required this.campaign,
  });

  @override
  State<EditCampaign> createState() => _EditCampaignState();
}

class _EditCampaignState extends State<EditCampaign> {
  late EditCampaignViewModel editCampaignViewModel;

  @override
  void initState() {
    super.initState();
    editCampaignViewModel = EditCampaignViewModel(
      campaignModel: widget.campaignModel,
      campaign: widget.campaign,
    );
  }

  @override
  void dispose() {
    editCampaignViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for better spacing
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4, // Left column takes 40% of the width
                  child: Text(
                    "Title",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 6, // Right column takes 60% of the width
                  child: TextField(
                    controller: editCampaignViewModel.titleController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Add spacing between rows
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListenableBuilder(
                    listenable: editCampaignViewModel,
                    builder: (BuildContext context, Widget? child) {
                      return Wrap(
                        spacing: 20,
                        children: List.generate(
                            editCampaignViewModel.categories.length, (index) {
                          Category currentCategory =
                              editCampaignViewModel.categories[index];
                          return CategoryComponent(
                            label: currentCategory.label,
                            isSelected: currentCategory.isSelected,
                            onTap: () {
                              editCampaignViewModel.selectCategory(index);
                            },
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: editCampaignViewModel.descriptionController,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
              color: Color(0xFFC1E965),
              child: GestureDetector(
                onTap: () {
                  editCampaignViewModel.update();
                  Navigator.pop(context);
                },
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
