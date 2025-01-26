import 'package:crowdfunding_frontend/model/schema/products.dart';

abstract class ProductModel {
  Future<Product> getProductById(String id);

  Future<List<Product>> getAllProducts();
}
