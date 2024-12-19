import 'package:mobx/mobx.dart';

import '../../core/domain/product/product.dart';

part 'favorite_list_store.g.dart';

class FavoriteListStore = FavoriteListStoreBase with _$FavoriteListStore;

abstract class FavoriteListStoreBase with Store {
  @observable
  ObservableList<Product> products = ObservableList();

  @action
  void setProducts(List<Product> newProducts) {
    products = ObservableList.of(newProducts);
  }

  bool hasProduct(Product product) {
    return products.indexWhere((stored) => stored.id == product.id) != -1;
  }

  void toggleProduct(Product product) {
    if (hasProduct(product)) {
      final newlist = products.where(
        (stored) => stored.id != product.id,
      );
      setProducts(newlist.toList());
    } else {
      setProducts([product, ...products]);
    }
  }
}
