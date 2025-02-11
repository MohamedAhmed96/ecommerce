import 'package:ecommerce/presentation/components/widgets/list_product_widget.dart';
import 'package:ecommerce/presentation/controller/products/products_bloc.dart';
import 'package:ecommerce/presentation/controller/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductState>(
      builder: (context, state) {
        print(state);
        return Scaffold(
          body: SafeArea(
            child: state is ProductsLoaded
                ? state.favorites.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.favorites.length,
                        itemBuilder: (context, index) {
                          final isFavorite = state.favorites
                              .any((p) => p.id == state.favorites[index].id);
                          return ListProductWidget(
                            product: state.favorites[index],
                            isFavorite: isFavorite,
                          );
                        })
                    : Center(
                        child: Text(
                          "Favorites is Empty",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      )
                : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
