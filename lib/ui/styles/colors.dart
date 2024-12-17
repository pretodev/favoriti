part of './styles.dart';

@immutable
class ColorStyles {
  const ColorStyles();

  static ColorStyles? lerp(ColorStyles? a, ColorStyles? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ColorStyles();
  }
}
