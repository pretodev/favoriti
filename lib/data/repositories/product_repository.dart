import 'package:result_dart/result_dart.dart';

import '../../core/domain/product/product.dart';
import '../../core/domain/product/product_repository.dart';
import '../services/api/api_client.dart';

class StoreProductRepository implements ProductRepository {
  final ApiClient _apiClient;

  StoreProductRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  AsyncResult<List<Product>> getProducts() {
    return _apiClient.getProducts();
  }
}
