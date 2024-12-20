import 'package:result_dart/result_dart.dart';

import '../commom/product.dart';

abstract interface class FavoriteRepository {
  AsyncResult<List<Product>> getProducts();
  AsyncResult<Unit> addProduct(Product product);
  AsyncResult<Unit> removeProduct(Product product);
}
