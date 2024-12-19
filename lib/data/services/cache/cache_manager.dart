import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/domain/product/product.dart';
import 'cached_data.dart';
import 'converters/cache_product_converters.dart';

class CacheManager {
  final _productConverters = CacheProductConverters();

  Future<void> saveProduct(Product product, Duration expireAt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'product.${product.id}',
      _productConverters.toCache(
        CachedData(
          value: product,
          expireAt: DateTime.now().add(expireAt),
        ),
      ),
    );
  }

  Future<CachedData<Product>?> getProduct(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final productJson = prefs.getString('product.$productId');
    if (productJson == null) {
      return null;
    }
    return _productConverters.fromCache(productJson);
  }
}
