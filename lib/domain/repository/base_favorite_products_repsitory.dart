import 'package:ecommerce/data/models/product_model.dart';

abstract class BaseFavoriteProductsRepsitory {
   Future<List<ProductModel>> getFavoriteProducts();
   Future<bool> toggleFavoriteProduct(ProductModel product);
}