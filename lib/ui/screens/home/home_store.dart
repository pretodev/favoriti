import 'package:mobx/mobx.dart';

import '../../../core/domain/catalog/product_repository.dart';
import '../../../core/domain/commom/product.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

enum HomeStatuses { none, loading, loaded, error, filtered }

abstract class HomeStoreBase with Store {
  final CatalogRepository _productRepository;

  HomeStoreBase({
    required CatalogRepository productRepository,
  }) : _productRepository = productRepository;

  @observable
  ObservableList<Product> products = ObservableList();

  @observable
  HomeStatuses status = HomeStatuses.none;

  @observable
  String errorMessage = '';

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
  void loading() {
    status = HomeStatuses.loading;
    errorMessage = '';
  }

  @action
  void loaded(List<Product> value) {
    products = ObservableList.of(value);
    status = HomeStatuses.loaded;
  }

  @action
  void error(String message) {
    errorMessage = message;
    status = HomeStatuses.error;
  }

  @action
  void setQuery(String value) {
    query = value;
    status = HomeStatuses.filtered;
  }

  void loadProducts() async {
    loading();
    final result = await _productRepository.getProducts();
    result //
        .onSuccess(loaded)
        .onFailure((err) => error(err.toString()));
  }
}
