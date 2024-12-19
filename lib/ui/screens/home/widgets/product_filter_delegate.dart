import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class ProductFilterDelegate extends SliverPersistentHeaderDelegate {
  const ProductFilterDelegate({
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final Styles(:colors, :text) = context.styles;

    return Container(
      color: colors.scaffoldBackground,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search Anything',
          prefixIcon: const Icon(Icons.search_sharp),
          filled: true,
          fillColor: colors.inputBackground,
          contentPadding: EdgeInsets.symmetric(
            vertical: 6.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: text.bodyMedium.copyWith(
            color: colors.bodyLight,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: text.bodyLarge,
          prefixIconColor: colors.body,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
