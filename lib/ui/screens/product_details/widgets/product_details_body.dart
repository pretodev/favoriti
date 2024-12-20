import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/commom/product.dart';
import '../../../styles/styles.dart';
import '../../../widgets/rating_view.dart';
import 'product_description_view.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Styles(:text, :colors) = context.styles;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9.0),
      child: Column(
        spacing: 20.0,
        children: [
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            width: 320,
            height: 320,
          ),
          Text(product.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingView(
                rate: product.rating.rate,
                count: product.rating.count,
              ),
              Text(
                product.price.asCurrency,
                style: text.headlineMedium.copyWith(color: colors.heading),
              ),
            ],
          ),
          ProductDescriptionView(
            icon: Icons.sort,
            content: product.category,
          ),
          ProductDescriptionView(
            icon: Icons.menu,
            content: product.description,
          ),
        ],
      ),
    );
  }
}
