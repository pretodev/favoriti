import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/domain/commom/product.dart';
import 'converters/local_favorite_product_converters.dart';

class LocalFavoriteProductList {
  final _favoriteProductConverters = LocalFavoriteProductConverters();

  Future<void> set(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('favorite_products');
    await prefs.setStringList(
      'favorite_products',
      _favoriteProductConverters.toLocal.convertAll(products),
    );
  }

  Future<List<Product>> get() async {
    final prefs = await SharedPreferences.getInstance();
    final products = prefs.getStringList('favorite_products');
    if (products == null) {
      return [];
    }
    return _favoriteProductConverters.fromLocal.convertAll(products);
  }
}
