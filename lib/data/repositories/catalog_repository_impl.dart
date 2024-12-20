import 'package:result_dart/result_dart.dart';

import '../../core/domain/catalog/product_repository.dart';
import '../../core/domain/commom/product.dart';
import '../services/api/api_client.dart';
import '../services/cache/cache_manager.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({
    required ApiClient apiClient,
    required CacheManager cacheManager,
  })  : _apiClient = apiClient,
        _cacheManager = cacheManager;

  final ApiClient _apiClient;
  final CacheManager _cacheManager;

  static const _cacheDuration = Duration(minutes: 5);

  @override
  AsyncResult<List<Product>> getProducts() async {
    final products = await _apiClient.getProducts();
    for (final product in products) {
      await _cacheManager.saveProduct(product, _cacheDuration);
    }
    return Success(products);
  }

  @override
  AsyncResult<Product> getProductFromId(int productId) async {
    final cached = await _cacheManager.getProduct(productId);
    if (cached != null && cached.expireAt.isAfter(DateTime.now())) {
      return Success(cached.value);
    }
    final remote = await _apiClient.getProductById(productId);
    await _cacheManager.saveProduct(remote, _cacheDuration);
    return Success(remote);
  }
}
