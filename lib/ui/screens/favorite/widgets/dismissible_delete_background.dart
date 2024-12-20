import 'package:flutter/material.dart';

class DismissibleDeleteBackground extends StatelessWidget {
  const DismissibleDeleteBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Icon(Icons.delete, color: Colors.white),
    );
  }
}
