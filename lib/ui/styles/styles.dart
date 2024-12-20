import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.dart';
part 'extensions.dart';
part 'text.dart';

@immutable
class Styles extends ThemeExtension<Styles> {
  static ThemeData get theme {
    final styles = Styles._(
      text: TextStyles.main(),
      colors: ColorStyles.main(),
    );

    return ThemeData(
      scaffoldBackgroundColor: styles.colors.scaffoldBackground,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: styles.text.appTitle.copyWith(
          color: styles.colors.body,
        ),
        backgroundColor: styles.colors.scaffoldBackground,
        iconTheme: IconThemeData(
          color: styles.colors.body,
        ),
      ),
      textTheme: TextTheme(
        titleSmall: styles.text.titleSmall,
        bodyLarge: styles.text.bodyLarge,
        bodyMedium: styles.text.bodyMedium,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Color(0xFF3366CC)),
          textStyle: WidgetStateProperty.all(
            styles.text.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      extensions: [styles],
    );
  }

  const Styles._({
    required this.text,
    required this.colors,
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
