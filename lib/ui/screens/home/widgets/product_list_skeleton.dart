import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/domain/commom/price.dart';
import '../../../../core/domain/commom/product.dart';
import '../../../../core/domain/commom/rating.dart';
import '../../../widgets/product_list_item.dart';

class ProductListSkeleton extends StatelessWidget {
  const ProductListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ProductListItem(
            product: Product(
              id: 0,
              title: 'Mens Casual Premium Slim Fit T-Shirts',
              price: Price(22.3),
              category: 'men\'s clothing',
              description: '',
              imageUrl: '',
              rating: Rating(rate: 4.1, count: 259),
            ),
          ),
          childCount: 5,
        ),
      ),
    );
  }
}
