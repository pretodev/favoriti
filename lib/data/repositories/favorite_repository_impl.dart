import 'package:result_dart/result_dart.dart';

import '../../core/domain/commom/product.dart';
import '../../core/domain/favorite/favorite_repository.dart';
import '../services/local/local_favorite_product_list.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final LocalFavoriteProductList _localFavoriteProductList;

  FavoriteRepositoryImpl({
    required LocalFavoriteProductList localFavoriteProductList,
  }) : _localFavoriteProductList = localFavoriteProductList;

  @override
  AsyncResult<List<Product>> getProducts() async {
    final products = await _localFavoriteProductList.get();
    return Success(products);
  }

  @override
  AsyncResult<Unit> addProduct(Product product) async {
    final products = await _localFavoriteProductList.get();
    if (products.contains(product)) {
      return Success(unit);
    }
    await _localFavoriteProductList.set([product, ...products]);
    return Success(unit);
  }

  @override
  AsyncResult<Unit> removeProduct(Product product) async {
    final products = await _localFavoriteProductList.get();
    final newProducts = products.where((p) => p != product).toList();
    await _localFavoriteProductList.set(newProducts);
    return Success(unit);
  }
}
