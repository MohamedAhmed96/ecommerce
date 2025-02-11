import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/domain/repository/base_favorite_products_repsitory.dart';

class ToggleFavoriteProductUsecase {
  final BaseFavoriteProductsRepsitory baseFavoriteProductsRepsitory;

  ToggleFavoriteProductUsecase(this.baseFavoriteProductsRepsitory);

  Future<bool> execute(ProductModel product) async{
    return await baseFavoriteProductsRepsitory.toggleFavoriteProduct(product);
  }
}