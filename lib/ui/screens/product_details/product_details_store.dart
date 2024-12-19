import 'package:mobx/mobx.dart';

import '../../../core/domain/product/product.dart';
import '../../../core/domain/product/product_repository.dart';

part 'product_details_store.g.dart';

class ProductDetailsStore = ProductDetailsStoreBase with _$ProductDetailsStore;

abstract class ProductDetailsStoreBase with Store {
  final ProductRepository _productRepository;

  ProductDetailsStoreBase({
    required ProductRepository productRepository,
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
    final result = await _productRepository.getFromId(productId);
    result.onSuccess(productLoaded);
  }
}
