import 'package:ecommerce/data/datasource/product_local_datasource.dart';
import 'package:ecommerce/data/datasource/product_remote_datasource.dart';
import 'package:ecommerce/data/repository/favorite_products_repository.dart';
import 'package:ecommerce/data/repository/products_repository.dart';
import 'package:ecommerce/data/repository/theme/theme_repository.dart';
import 'package:ecommerce/domain/usecases/theme/get_theme_usecase.dart';
import 'package:ecommerce/domain/usecases/theme/set_theme_usecase.dart';
import 'package:ecommerce/presentation/components/screens/navbar.dart';
import 'package:ecommerce/presentation/controller/navbar/navbar_bloc.dart';
import 'package:ecommerce/presentation/controller/products/products_bloc.dart';
import 'package:ecommerce/presentation/controller/products/products_event.dart';
import 'package:ecommerce/presentation/controller/theme/theme_bloc.dart';
import 'package:ecommerce/presentation/controller/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final productLocalDatasource = ProductLocalDatasource();
  final favoriteProductsRepository = FavoriteProductsRepository(
      baseProductLocalDatasource: productLocalDatasource);

  final productRemoteDatasource = ProductRemoteDatasource();
  final productsRepository =
      ProductsRepository(baseProductRemoteDatasource: productRemoteDatasource);

  final themeRepository = ThemeRepository();
  final getThemeUseCase = GetThemeUseCase(themeRepository);
  final setThemeUseCase = SetThemeUseCase(themeRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(
            productsRepository: productsRepository,
            favoriteProductsRepository: favoriteProductsRepository,
          )..add(GetProductsEvent()),
        ),
        BlocProvider(
          create: (context) => NavbarBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(
            getThemeUseCase: getThemeUseCase,
            setThemeUseCase: setThemeUseCase,
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Ecommerce',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey[350],
              elevation: 20,
              selectedIconTheme: IconThemeData(
                color: Colors.white,
              ),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.blueGrey,
            ),
            colorScheme: ColorScheme.dark(
              surface: Colors.blueGrey[900]!,
              secondary: Colors.white,
            ),
            textTheme: TextTheme(
              headlineMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              headlineSmall: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          themeMode:
              state is LightThemeState ? ThemeMode.light : ThemeMode.dark,
          theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey[350],
              elevation: 20,
              selectedIconTheme: IconThemeData(
                color: Colors.white,
              ),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.blueGrey,
            ),
            colorScheme: ColorScheme.light(
              surface: Colors.white,
              secondary: Colors.blueGrey[900]!,
            ),
            textTheme: TextTheme(
              headlineMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey[900],
              ),
              headlineSmall: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          home: Navbar(),
        );
      },
    );
  }
}
