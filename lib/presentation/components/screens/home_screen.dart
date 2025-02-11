import 'package:ecommerce/presentation/components/widgets/list_product_widget.dart';
import 'package:ecommerce/presentation/controller/products/products_bloc.dart';
import 'package:ecommerce/presentation/controller/products/products_state.dart';
import 'package:ecommerce/presentation/controller/theme/theme_bloc.dart';
import 'package:ecommerce/presentation/controller/theme/theme_event.dart';
import 'package:ecommerce/presentation/controller/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<ProductsBloc, ProductState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () =>
                              context.read<ThemeBloc>().add(ToggleThemeEvent()),
                          child: Icon(
                            Icons.dark_mode,
                            color: themeState is LightThemeState
                                ? Colors.blueGrey
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  state is ProductsLoaded
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final isFavorite = state.favorites.any(
                                    (p) => p.id == state.products[index].id);
                                return ListProductWidget(
                                  product: state.products[index],
                                  isFavorite: isFavorite,
                                );
                              }),
                        )
                      : Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                ],
              )),
            );
          },
        );
      },
    );
  }
}
