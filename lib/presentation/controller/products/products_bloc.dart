import 'package:ecommerce/domain/repository/base_favorite_products_repsitory.dart';
import 'package:ecommerce/domain/repository/base_products_repository.dart';
import 'package:ecommerce/domain/usecases/get_favorite_products_usecase.dart';
import 'package:ecommerce/domain/usecases/get_products_usecase.dart';
import 'package:ecommerce/presentation/controller/products/products_event.dart';
import 'package:ecommerce/presentation/controller/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductState> {
  final BaseProductsRepository productsRepository;
  final BaseFavoriteProductsRepsitory favoriteProductsRepository;
  ProductsBloc({
    required this.productsRepository,
    required this.favoriteProductsRepository,
  }) : super(ProductInitial()) {
    on<GetProductsEvent>(_onFetchProducts);
    on<ToggleFavoriteProductsEvent>(_onToggleFavorite);
  }

  Future<void> _onFetchProducts(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await GetProductsUsecase(productsRepository).execute();
      final favorites =
          await GetFavoriteProductsUsecase(favoriteProductsRepository)
              .execute();
      emit(ProductsLoaded(products: products, favorites: favorites));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
      ToggleFavoriteProductsEvent event, Emitter<ProductState> emit) async {
    if (state is ProductsLoaded) {
      await favoriteProductsRepository.toggleFavoriteProduct(event.product);
      final favorites = await favoriteProductsRepository.getFavoriteProducts();

      final currentState = state as ProductsLoaded;
      emit(ProductsLoaded(
        products: currentState.products,
        favorites: favorites,
      ));
    }
  }
}
