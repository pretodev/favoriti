// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailsStore on ProductDetailsStoreBase, Store {
  late final _$productAtom =
      Atom(name: 'ProductDetailsStoreBase.product', context: context);

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'ProductDetailsStoreBase.status', context: context);

  @override
  ProductDetailsStatuses get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ProductDetailsStatuses value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'ProductDetailsStoreBase.errorMessage', context: context);

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

  late final _$ProductDetailsStoreBaseActionController =
      ActionController(name: 'ProductDetailsStoreBase', context: context);

  @override
  void loaded(Product product) {
    final _$actionInfo = _$ProductDetailsStoreBaseActionController.startAction(
        name: 'ProductDetailsStoreBase.loaded');
    try {
      return super.loaded(product);
    } finally {
      _$ProductDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loading() {
    final _$actionInfo = _$ProductDetailsStoreBaseActionController.startAction(
        name: 'ProductDetailsStoreBase.loading');
    try {
      return super.loading();
    } finally {
      _$ProductDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void error(String message) {
    final _$actionInfo = _$ProductDetailsStoreBaseActionController.startAction(
        name: 'ProductDetailsStoreBase.error');
    try {
      return super.error(message);
    } finally {
      _$ProductDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
status: ${status},
errorMessage: ${errorMessage}
    ''';
  }
}
