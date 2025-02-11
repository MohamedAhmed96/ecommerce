import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/domain/repository/base_products_repository.dart';

class GetProductsUsecase {
  final BaseProductsRepository baseProductsRepository;

  GetProductsUsecase(this.baseProductsRepository);

  Future< List<ProductModel>> execute() async {
    return await baseProductsRepository.getProducts();
  }
}
