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

  late final _$loadingAtom =
      Atom(name: 'ProductDetailsStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$ProductDetailsStoreBaseActionController =
      ActionController(name: 'ProductDetailsStoreBase', context: context);

  @override
  void productLoaded(Product product) {
    final _$actionInfo = _$ProductDetailsStoreBaseActionController.startAction(
        name: 'ProductDetailsStoreBase.productLoaded');
    try {
      return super.productLoaded(product);
    } finally {
      _$ProductDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
loading: ${loading}
    ''';
  }
}
