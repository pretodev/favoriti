import 'package:result_dart/result_dart.dart';

import '../commom/product.dart';

abstract interface class CatalogRepository {
  AsyncResult<List<Product>> getProducts();

  AsyncResult<Product> getProductFromId(int productId);
}
