import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/domain/repository/base_favorite_products_repsitory.dart';

class GetFavoriteProductsUsecase {
  final BaseFavoriteProductsRepsitory baseFavoriteProductsRepsitory;

  GetFavoriteProductsUsecase(this.baseFavoriteProductsRepsitory);

  Future<List<ProductModel>> execute() async{
    return await baseFavoriteProductsRepsitory.getFavoriteProducts();
  }
}