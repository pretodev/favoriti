import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({
    super.key,
    required this.icon,
    required this.content,
  });

  final IconData icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    final Styles(:text, :colors) = context.styles;
    return Row(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colors.body),
        Expanded(
          child: Text(
            content,
            style: text.bodyLarge.copyWith(color: colors.body),
          ),
        ),
      ],
    );
  }
}
