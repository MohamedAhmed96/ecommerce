import 'package:ecommerce/data/datasource/product_local_datasource.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/domain/repository/base_favorite_products_repsitory.dart';

class FavoriteProductsRepository extends BaseFavoriteProductsRepsitory {
  final BaseProductLocalDatasource baseProductLocalDatasource;

  FavoriteProductsRepository({required this.baseProductLocalDatasource});


  @override
  Future<List<ProductModel>> getFavoriteProducts() async { 
    return await baseProductLocalDatasource.loadFavorites();
  }

  @override
  Future<bool> toggleFavoriteProduct(ProductModel product) async{
    return await baseProductLocalDatasource.toggleFavorite(product);
  }
}
