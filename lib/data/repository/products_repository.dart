import 'package:ecommerce/data/datasource/product_remote_datasource.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/domain/repository/base_products_repository.dart';

class ProductsRepository extends BaseProductsRepository {
  final BaseProductRemoteDatasource baseProductRemoteDatasource;

  ProductsRepository({required this.baseProductRemoteDatasource});

  @override
  Future<List<ProductModel>> getProducts() async{
    final results = await baseProductRemoteDatasource.getProducts();
    try {
      return results;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
