import 'package:flutter/material.dart';

part 'colors.dart';
part 'extensions.dart';
part 'text.dart';

@immutable
class Styles extends ThemeExtension<Styles> {
  static ThemeData get theme {
    final styles = Styles._();

    return ThemeData(
      extensions: [styles],
    );
  }

  const Styles._({
    this.text = const TextStyles(),
    this.colors = const ColorStyles(),
  });

  final TextStyles text;
  final ColorStyles colors;

  @override
  ThemeExtension<Styles> copyWith({
    TextStyles? text,
    ColorStyles? colors,
  }) {
    return Styles._(
      text: text ?? this.text,
      colors: colors ?? this.colors,
    );
  }

  @override
  ThemeExtension<Styles> lerp(covariant Styles? other, double t) {
    return Styles._(
      text: TextStyles.lerp(text, other?.text, t)!,
      colors: ColorStyles.lerp(colors, other?.colors, t)!,
    );
  }
}
