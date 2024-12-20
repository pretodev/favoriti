import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final Styles(:colors, :text) = context.styles;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.0,
        children: [
          Icon(
            Icons.favorite,
            size: 100.0,
            color: colors.bodyLight,
          ),
          Text(
            'Empty Favorites List!',
            style: text.bodyLarge.copyWith(
              color: colors.bodyLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
