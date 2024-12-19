import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/product/product.dart';
import '../../../styles/styles.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(
          product: products[index],
        );
      },
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Styles(:text, :colors) = context.styles;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            spacing: 18.0,
            children: [
              CachedNetworkImage(
                imageUrl: product.imageUrl,
                width: 120.0,
                height: 120.0,
              ),
              Flexible(
                child: Column(
                  spacing: 1.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: text.bodyLarge),
                    Row(
                      spacing: 8.0,
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFD700)),
                        Text(
                          '${product.rating.rate} (${product.rating.count} reviews)',
                          style:
                              text.bodyLarge.copyWith(color: colors.bodyLight),
                        ),
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
    );
  }
}
