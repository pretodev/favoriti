import 'package:flutter/material.dart';

import '../styles/styles.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.rate, required this.count});

  final double rate;
  final int count;

  @override
  Widget build(BuildContext context) {
    final Styles(:text, :colors) = context.styles;
    return Row(
      spacing: 4.0,
      children: [
        Icon(Icons.star, color: Color(0xFFFFD700)),
        Text(
          '$rate ($count reviews)',
          style: text.bodyMedium.copyWith(color: colors.bodyLight),
        ),
      ],
    );
  }
}
