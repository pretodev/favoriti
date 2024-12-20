import 'package:mobx/mobx.dart';

import '../../../core/domain/catalog/product_repository.dart';
import '../../../core/domain/commom/product.dart';

part 'product_details_store.g.dart';

class ProductDetailsStore = ProductDetailsStoreBase with _$ProductDetailsStore;

abstract class ProductDetailsStoreBase with Store {
  final CatalogRepository _productRepository;

  ProductDetailsStoreBase({
    required CatalogRepository productRepository,
  }) : _productRepository = productRepository;

  @observable
  Product? product;

  @observable
  bool loading = false;

  @action
  void productLoaded(Product product) {
    this.product = product;
    loading = false;
  }

  void loadProduct(int productId) async {
    loading = true;
    final result = await _productRepository.getProductFromId(productId);
    result.onSuccess(productLoaded);
  }
}
