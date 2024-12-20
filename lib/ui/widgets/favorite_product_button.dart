import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../configs/service_locator/service_locator.dart';
import '../../core/domain/commom/product.dart';
import '../state/favorite_list_store.dart';
import '../styles/styles.dart';

class FavoriteProductButton extends StatefulWidget {
  const FavoriteProductButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<FavoriteProductButton> createState() => _FavoriteProductButtonState();
}

class _FavoriteProductButtonState extends State<FavoriteProductButton>
    with ServiceLocatorMixin {
  late final _favoriteListStore = instance<FavoriteListStore>();

  @override
  Widget build(BuildContext context) {
    final Styles(:colors) = context.styles;
    return Observer(
      builder: (context) {
        return IconButton(
          icon: _favoriteListStore.hasProduct(widget.product)
              ? Icon(
                  Icons.favorite,
                  color: colors.likeButtonEnabled,
                  size: 18.0,
                )
              : Icon(
                  Icons.favorite_border,
                  color: colors.bodyLight,
                  size: 18.0,
                ),
          onPressed: () => _favoriteListStore.toggleProduct(widget.product),
        );
      },
    );
  }
}
