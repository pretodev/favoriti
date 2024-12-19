import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../../configs/environment.dart';
import '../../../core/domain/product/product.dart';
import '../../mapper.dart';
import 'mappers/api_product_mapper.dart';

class ApiClient {
  final Dio _client;

  ApiClient(Environment environment)
      : _client = Dio(BaseOptions(baseUrl: environment.apiBaseUrl));

  AsyncResult<List<Product>> getProducts() async {
    final response = await _client.get('/products');
    final products = Mapper.it(response.data, ApiProductMapper()).toList();
    return Success(products);
  }

  AsyncResult<Product> getProductById(int id) async {
    final response = await _client.get('/products/$id');
    final product = ApiProductMapper().map(response.data);
    return Success(product);
  }
}
