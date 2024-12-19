import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../configs/service_locator/service_locator.dart';
import '../../../state/favorite_list_store.dart';
import '../../../widgets/product_list_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with ServiceLocatorMixin {
  late final _favoritesStore = instance<FavoriteListStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Observer(
        builder: (context) {
          final products = _favoritesStore.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductListItem(product: product);
            },
          );
        },
      ),
    );
  }
}
