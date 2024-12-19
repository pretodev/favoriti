import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/product/product.dart';
import '../../../styles/styles.dart';
import '../../../widgets/favorite_product_button.dart';
import '../../../widgets/rating_view.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
    this.onClicked,
  });

  final Product product;
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    final Styles(:text, :colors) = context.styles;
    return InkWell(
      onTap: onClicked,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              spacing: 10.0,
              children: [
                CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  width: 100.0,
                  height: 100.0,
                ),
                Expanded(
                  child: Column(
                    spacing: 1.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(product.title, style: text.bodyLarge),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingView(
                            rate: product.rating.rate,
                            count: product.rating.count,
                          ),
                          FavoriteProductButton(product: product),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        product.price.asCurrency,
                        style: text.titleSmall.copyWith(color: colors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 0.0, color: colors.divider),
        ],
      ),
    );
  }
}
