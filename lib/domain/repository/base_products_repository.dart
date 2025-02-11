import 'package:ecommerce/data/models/product_model.dart';

abstract class BaseProductsRepository {
  Future<List<ProductModel>> getProducts();
}