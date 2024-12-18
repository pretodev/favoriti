import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/product/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    print(products);
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
    return Row(
      spacing: 18.0,
      children: [
        CachedNetworkImage(
          imageUrl: product.imageUrl,
          height: 121.0,
          width: 126.62,
        ),
        Flexible(
          child: Column(
            spacing: 1.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title),
              Text('${product.rating.rate} (${product.rating.count} reviews)'),
              SizedBox(height: 8.0),
              Text('${product.price}'),
            ],
          ),
        ),
      ],
    );
  }
}
