import 'package:crowdfunding_frontend/components/app_bar.dart';
import 'package:crowdfunding_frontend/components/category.dart';
import 'package:crowdfunding_frontend/controllers/create_campaign_view_model.dart';
import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/product_model.dart';
import 'package:crowdfunding_frontend/views/create_product.dart';
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

    createCampaignViewModel.goalController
        .addListener(createCampaignViewModel.readyToCreate);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    createCampaignViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: Padding(
            padding:
                const EdgeInsets.all(16.0), // Add padding for better spacing
            child: Column(children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4, // Left column takes 40% of the width
                        child: Text(
                          "Title",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6, // Right column takes 60% of the width
                        child: TextField(
                          controller: createCampaignViewModel.titleController,
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
                          "Add a photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      ListenableBuilder(
                          listenable: createCampaignViewModel,
                          builder: (BuildContext context, Widget? child) {
                            return Container(
                              width: 150.0,
                              height: 150.0,
                              color: Colors.grey,
                              child: createCampaignViewModel.imageFile == null
                                  ? Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.image,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SafeArea(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.photo_library),
                                                      title: const Text(
                                                          'Elegir de galería'),
                                                      onTap: () {
                                                        createCampaignViewModel
                                                            .pickImage();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  : Image.file(
                                      createCampaignViewModel.imageFile!,
                                      fit: BoxFit.contain,
                                    ),
                            );
                          }),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: ListenableBuilder(
                          listenable: createCampaignViewModel,
                          builder: (BuildContext context, Widget? child) {
                            return Wrap(
                              spacing: 20,
                              children: List.generate(
                                  createCampaignViewModel.categories.length,
                                  (index) {
                                Category currentCategory =
                                    createCampaignViewModel.categories[index];
                                return CategoryComponent(
                                  label: currentCategory.label,
                                  isSelected: currentCategory.isSelected,
                                  onTap: () {
                                    createCampaignViewModel
                                        .selectCategory(index);
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
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: TextField(
                          controller:
                              createCampaignViewModel.descriptionController,
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
                          "Goal",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: createCampaignViewModel.goalController,
                        ),
                      ),
                    ],
                  ),
                  ListenableBuilder(
                      listenable: createCampaignViewModel,
                      builder: (BuildContext context, Widget? child) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          margin: EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 30),
                          color: createCampaignViewModel.productColor,
                          child: GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateProduct(),
                                ),
                              );
                              createCampaignViewModel.setProduct(result);
                              createCampaignViewModel.disableAddProduct();
                            },
                            child: Text(
                              'Add product',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                ],
              )),
              Expanded(child: Container()),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                color: createCampaignViewModel.doneColor,
                child: GestureDetector(
                  onTap: () async {
                    await createCampaignViewModel.createCampaign();
                    Navigator.pop(context, "update");
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ])));
  }
}
