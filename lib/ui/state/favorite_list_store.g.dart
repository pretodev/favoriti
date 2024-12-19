// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteListStore on FavoriteListStoreBase, Store {
  late final _$productsAtom =
      Atom(name: 'FavoriteListStoreBase.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$FavoriteListStoreBaseActionController =
      ActionController(name: 'FavoriteListStoreBase', context: context);

  @override
  void setProducts(List<Product> newProducts) {
    final _$actionInfo = _$FavoriteListStoreBaseActionController.startAction(
        name: 'FavoriteListStoreBase.setProducts');
    try {
      return super.setProducts(newProducts);
    } finally {
      _$FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
