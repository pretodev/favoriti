import 'package:mobx/mobx.dart';

import '../../../core/domain/catalog/product_repository.dart';
import '../../../core/domain/commom/product.dart';

part 'product_details_store.g.dart';

class ProductDetailsStore = ProductDetailsStoreBase with _$ProductDetailsStore;

enum ProductDetailsStatuses { none, loading, loaded, error }

abstract class ProductDetailsStoreBase with Store {
  final CatalogRepository _productRepository;

  ProductDetailsStoreBase({
    required CatalogRepository productRepository,
  }) : _productRepository = productRepository;

  @observable
  Product? product;

  @observable
  ProductDetailsStatuses status = ProductDetailsStatuses.none;

  @observable
  String errorMessage = '';

  @action
  void loaded(Product product) {
    this.product = product;
    status = ProductDetailsStatuses.loaded;
  }

  @action
  void loading() {
    status = ProductDetailsStatuses.loading;
    errorMessage = '';
  }

  @action
  void error(String message) {
    errorMessage = message;
    status = ProductDetailsStatuses.error;
  }

  void loadProduct(int productId) async {
    loading();
    final result = await _productRepository.getProductFromId(productId);
    result //
        .onSuccess(loaded)
        .onFailure((err) => error(err.toString()));
  }
}
