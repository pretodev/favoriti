import 'package:mobx/mobx.dart';

import '../../../core/domain/product/product.dart';
import '../../../core/domain/product/product_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ProductRepository _productRepository;

  HomeStoreBase({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @observable
  ObservableList<Product> products = ObservableList();

  @observable
  bool loading = false;

  @observable
  String query = '';

  @computed
  List<Product> get filteredProducts {
    if (query.isEmpty) {
      return products;
    }
    return products
        .where(
          (product) =>
              product.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  @action
  void loadedProducts(List<Product> value) {
    products = ObservableList.of(value);
    loading = false;
  }

  @action
  void loadingProducts() {
    loading = true;
  }

  @action
  void setQuery(String value) {
    query = value;
  }

  void loadProducts() async {
    loadingProducts();
    final result = await _productRepository.getProducts();
    result.onSuccess(loadedProducts);
  }
}
