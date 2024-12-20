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

  late final _$prevProductsAtom =
      Atom(name: 'FavoriteListStoreBase.prevProducts', context: context);

  @override
  ObservableList<Product> get prevProducts {
    _$prevProductsAtom.reportRead();
    return super.prevProducts;
  }

  @override
  set prevProducts(ObservableList<Product> value) {
    _$prevProductsAtom.reportWrite(value, super.prevProducts, () {
      super.prevProducts = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'FavoriteListStoreBase.status', context: context);

  @override
  FavoriteListStatuses get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(FavoriteListStatuses value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'FavoriteListStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$FavoriteListStoreBaseActionController =
      ActionController(name: 'FavoriteListStoreBase', context: context);

  @override
  void loaded(List<Product> newProducts) {
    final _$actionInfo = _$FavoriteListStoreBaseActionController.startAction(
        name: 'FavoriteListStoreBase.loaded');
    try {
      return super.loaded(newProducts);
    } finally {
      _$FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loading() {
    final _$actionInfo = _$FavoriteListStoreBaseActionController.startAction(
        name: 'FavoriteListStoreBase.loading');
    try {
      return super.loading();
    } finally {
      _$FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saving(List<Product> newProducts) {
    final _$actionInfo = _$FavoriteListStoreBaseActionController.startAction(
        name: 'FavoriteListStoreBase.saving');
    try {
      return super.saving(newProducts);
    } finally {
      _$FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void error(Exception e) {
    final _$actionInfo = _$FavoriteListStoreBaseActionController.startAction(
        name: 'FavoriteListStoreBase.error');
    try {
      return super.error(e);
    } finally {
      _$FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
prevProducts: ${prevProducts},
status: ${status},
errorMessage: ${errorMessage}
    ''';
  }
}
