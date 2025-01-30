class Product {
  String campaignId;
  String productId;
  String name;
  String imageUrl;
  double price;
  double discount;

  Product(
      {required this.campaignId,
      required this.productId,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.discount});

  factory Product.fromJson(Map<String, dynamic> json) {
    String domain = 'https://mysite-f0j9.onrender.com';
    String finalImageLink = domain + '/' + json['images'][0];

    if (json.containsKey('product_id') &&
        json.containsKey('name') &&
        json.containsKey('price') &&
        json.containsKey('discount') &&
        json.containsKey('campaign_id') &&
        json.containsKey('images') &&
        json['images'] is List) {
      return Product(
        productId: json['product_id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        discount: (json['discount'] as num).toDouble(),
        campaignId: json['campaign_id'],
        imageUrl: (json['images'] as List).isNotEmpty ? finalImageLink : '',
      );
    } else {
      throw const FormatException("Failed to load product");
    }
  }
}
