import 'dart:convert';

import 'package:ecommerce/core/network/api_constances.dart';
import 'package:ecommerce/data/models/product_model.dart';
import "package:http/http.dart" as http;

abstract class BaseProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDatasource extends BaseProductRemoteDatasource {
  @override
  Future<List<ProductModel>> getProducts() async {
    var response = await http.get(
      Uri.parse(ApiConstances.productsPath),
    );
    if (response.statusCode == 200) {
      var decodedBody = jsonDecode(response.body);
      return List<ProductModel>.from(
        (decodedBody as List).map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    } else {
      throw Exception([response.body]);
    }
  }
}
