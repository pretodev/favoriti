import 'package:mobx/mobx.dart';

import '../../../core/domain/product/product.dart';
import '../../../core/domain/product/product_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final ProductRepository _productRepository;

  _HomeStore({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @observable
  ObservableList<Product> products = ObservableList();

  @observable
  bool loading = false;

  @action
  void loadedProducts(List<Product> value) {
    products = ObservableList.of(value);
    loading = false;
  }

  @action
  void loadingProducts() {
    loading = true;
  }

  void loadProducts() async {
    loadingProducts();
    final result = await _productRepository.getProducts();
    result.onSuccess(loadedProducts);
  }
}
