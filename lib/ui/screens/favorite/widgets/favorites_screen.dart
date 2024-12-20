import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../configs/service_locator/service_locator.dart';
import '../../../state/favorite_list/favorite_list_store.dart';
import '../../../widgets/product_list_item.dart';
import 'dismissible_delete_background.dart';
import 'dismissible_indicator.dart';

class FavoritesScreen extends StatelessWidget with ServiceLocatorMixin {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Observer(
        builder: (context) {
          final products = instance<FavoriteListStore>().products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              if (index == 0) {
                return DismissibleIndicator(
                  child: Dismissible(
                    key: ValueKey(product.id),
                    direction: DismissDirection.endToStart,
                    background: DismissibleDeleteBackground(),
                    child: ProductListItem(product: product),
                    onDismissed: (_) {
                      instance<FavoriteListStore>().removeProduct(product);
                    },
                  ),
                );
              }

              return Dismissible(
                key: ValueKey(product.id),
                direction: DismissDirection.endToStart,
                background: DismissibleDeleteBackground(),
                child: ProductListItem(product: product),
                onDismissed: (_) {
                  instance<FavoriteListStore>().removeProduct(product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
