import 'package:crowdfunding_frontend/model/campaign_model.dart';
import 'package:crowdfunding_frontend/model/schema/campaigns.dart';
import 'package:crowdfunding_frontend/model/schema/products.dart';

class CampaignModelLocal extends CampaignModel {
  static List<Campaign> storedCampaigns = [
    Campaign(
        campaignId: '1',
        userId: '1',
        userName: 'unicef',
        title: 'Ecological Medicine',
        category: 'Technology',
        description: 'A description',
        product: Product(
          campaignId: '1',
          productId: '1',
          name: 'medicine',
          imageUrl: 'https://placehold.jp/150x150.png',
          price: 30,
          discount: 10,
        ),
        goal: 1000,
        currentMoney: 267,
        imageLink:
            'https://plus.unsplash.com/premium_photo-1663032618920-6cc64f857e65?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Campaign(
      campaignId: '2',
      userId: '2',
      userName: 'Steve Madson',
      title: 'Smart Home',
      category: 'Technology',
      description: 'A description',
      product: Product(
        campaignId: '2',
        productId: '2',
        name: 'Smart speaker with Alexa',
        imageUrl: 'https://placehold.jp/150x150.png',
        price: 40,
        discount: 5,
      ),
      goal: 5000,
      currentMoney: 0,
      imageLink:
          'https://images.unsplash.com/photo-1558089687-f282ffcbc126?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    )
  ];

  @override
  Future<List<Campaign>> getAll() async {
    return storedCampaigns;
  }

  @override
  Future<Campaign> getById(String id) async {
    for (int i = 0; i < storedCampaigns.length; i++) {
      Campaign currentCampaign = storedCampaigns.elementAt(i);

      if (currentCampaign.campaignId == id) {
        return currentCampaign;
      }
    }
    throw ("Not found");
  }
}
