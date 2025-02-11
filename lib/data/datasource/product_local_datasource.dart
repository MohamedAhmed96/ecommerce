import 'dart:convert';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseProductLocalDatasource {
  Future<bool> toggleFavorite(ProductModel product);
  Future<List<ProductModel>> loadFavorites();
}

class ProductLocalDatasource extends BaseProductLocalDatasource {
  @override
  Future<bool> toggleFavorite(ProductModel product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<ProductModel> favorites = await loadFavorites();

      if (favorites.any((p) => p.id == product.id)) {
        favorites.removeWhere((p) => p.id == product.id);
      } else {
        favorites.add(product);
      }
      List<String> jsonList =
          favorites.map((p) => jsonEncode(p.toJson())).toList();
      await prefs.setStringList('favorites', jsonList);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<ProductModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList('favorites');

    if (jsonList == null) return [];

    return jsonList
        .map(
          (jsonString) => ProductModel.fromJson(
            jsonDecode(jsonString),
          ),
        )
        .toList();
  }
}
