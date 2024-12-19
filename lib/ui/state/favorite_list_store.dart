import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';

import '../../core/domain/favorite_product/favorite_product_repository.dart';
import '../../core/domain/product/product.dart';

part 'favorite_list_store.g.dart';

enum FavoriteListStoreState {
  none,
  loading,
  loaded,
  saving,
  saved,
  error,
}

class FavoriteListStore = FavoriteListStoreBase with _$FavoriteListStore;

abstract class FavoriteListStoreBase with Store {
  final FavoriteProductRepository _favoriteProductRepository;

  FavoriteListStoreBase({
    required FavoriteProductRepository favoriteProductRepository,
  }) : _favoriteProductRepository = favoriteProductRepository {
    loadProducts();
  }

  @observable
  ObservableList<Product> products = ObservableList();

  @observable
  ObservableList<Product> prevProducts = ObservableList();

  @observable
  FavoriteListStoreState state = FavoriteListStoreState.none;

  @observable
  String errorMessage = '';

  @action
  void loaded(List<Product> newProducts) {
    state = FavoriteListStoreState.loaded;
    products = ObservableList.of(newProducts);
  }

  void saved(_) {
    state = FavoriteListStoreState.saved;
  }

  @action
  void loading() {
    prevProducts = ObservableList.of(products);
    state = FavoriteListStoreState.loading;
    errorMessage = '';
  }

  @action
  void saving(List<Product> newProducts) {
    prevProducts = ObservableList.of(products);
    products = ObservableList.of(newProducts);
    state = FavoriteListStoreState.saving;
    errorMessage = '';
  }

  @action
  void error(Exception e) {
    state = FavoriteListStoreState.error;
    errorMessage = e.toString();
    products = ObservableList.of(prevProducts);
  }

  bool hasProduct(Product product) {
    return products.indexWhere((stored) => stored.id == product.id) != -1;
  }

  Future<void> toggleProduct(Product product) async {
    final prevList = [...products];
    AsyncResult<Unit>? result;
    if (hasProduct(product)) {
      final newlist = prevList.where(
        (stored) => stored.id != product.id,
      );
      saving(newlist.toList());
      result = _favoriteProductRepository.remove(product);
    } else {
      saving([product, ...prevList]);
      result = _favoriteProductRepository.add(product);
    }
    await result //
        .onSuccess(saved)
        .onFailure(error);
  }

  void loadProducts() async {
    await _favoriteProductRepository //
        .getAll()
        .onSuccess(loaded)
        .onFailure(error);
  }
}
