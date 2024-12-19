import 'package:result_dart/result_dart.dart';

import '../product/product.dart';

abstract interface class FavoriteProductRepository {
  AsyncResult<List<Product>> getAll();
  AsyncResult<Unit> add(Product product);
  AsyncResult<Unit> remove(Product product);
}
