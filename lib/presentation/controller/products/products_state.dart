import 'package:ecommerce/data/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<ProductModel> products;
  final List<ProductModel> favorites;

  ProductsLoaded({
    required this.products,
    required this.favorites,
  });
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}
