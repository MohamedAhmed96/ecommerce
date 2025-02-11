import 'package:ecommerce/data/models/product_model.dart';

abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class ToggleFavoriteProductsEvent extends ProductsEvent {
  final ProductModel product;

  ToggleFavoriteProductsEvent(this.product);
}
