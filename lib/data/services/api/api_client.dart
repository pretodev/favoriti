import 'package:dio/dio.dart';

import '../../../configs/environment.dart';
import '../../../core/domain/product/product.dart';
import 'converters/api_product_converters.dart';

class ApiClient {
  ApiClient(
    Environment environment,
  ) : _client = Dio(BaseOptions(baseUrl: environment.apiBaseUrl));

  final Dio _client;

  final _productConverters = ApiProductConverters();

  Future<List<Product>> getProducts() async {
    final response = await _client.get('/products');
    return _productConverters.fromMap.convertAll(response.data);
  }

  Future<Product> getProductById(int id) async {
    final response = await _client.get('/products/$id');
    return _productConverters.fromMap(response.data ?? {});
  }
}
