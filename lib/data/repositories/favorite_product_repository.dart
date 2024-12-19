import 'package:result_dart/result_dart.dart';

import '../../core/domain/favorite_product/favorite_product_repository.dart';
import '../../core/domain/product/product.dart';
import '../services/local/local_favorite_product_list.dart';

class FavoriteProductRepositoryImpl implements FavoriteProductRepository {
  final LocalFavoriteProductList _localFavoriteProductList;

  FavoriteProductRepositoryImpl({
    required LocalFavoriteProductList localFavoriteProductList,
  }) : _localFavoriteProductList = localFavoriteProductList;

  @override
  AsyncResult<List<Product>> getAll() async {
    final products = await _localFavoriteProductList.get();
    return Success(products);
  }

  @override
  AsyncResult<Unit> add(Product product) async {
    final products = await _localFavoriteProductList.get();
    if (products.contains(product)) {
      return Success(unit);
    }
    await _localFavoriteProductList.set([product, ...products]);
    return Success(unit);
  }

  @override
  AsyncResult<Unit> remove(Product product) async {
    final products = await _localFavoriteProductList.get();
    final newProducts = products.where((p) => p != product).toList();
    await _localFavoriteProductList.set(newProducts);
    return Success(unit);
  }
}
