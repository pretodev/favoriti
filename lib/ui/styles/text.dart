part of './styles.dart';

@immutable
class TextStyles {
  const TextStyles();

  static TextStyles? lerp(TextStyles? a, TextStyles? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return TextStyles();
  }
}
