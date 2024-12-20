import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Illustraction extends StatelessWidget {
  const Illustraction({
    super.key,
    required this.name,
    required this.width,
    required this.height,
  });

  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/illustractions/$name.svg',
      width: width,
      height: height,
    );
  }
}
