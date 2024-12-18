import 'package:result_dart/result_dart.dart';

import 'product.dart';

abstract interface class ProductRepository {
  AsyncResult<List<Product>> getProducts();
}
