part of './styles.dart';

@immutable
class ColorStyles {
  factory ColorStyles.main() {
    return ColorStyles(
      primary: const Color(0xFFF37A20),
      body: const Color(0xFF37474F),
      bodyLight: const Color(0xA637474F),
      scaffoldBackground: const Color(0xFFFBFCFF),
      divider: const Color(0xFFF0F0F0),
    );
  }

  const ColorStyles({
    required this.primary,
    required this.body,
    required this.bodyLight,
    required this.scaffoldBackground,
    required this.divider,
  });

  final Color primary;

  final Color body;
  final Color bodyLight;

  final Color scaffoldBackground;

  final Color divider;

  static ColorStyles? lerp(ColorStyles? a, ColorStyles? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ColorStyles(
      primary: Color.lerp(a!.primary, b!.primary, t)!,
      body: Color.lerp(a.body, b.body, t)!,
      bodyLight: Color.lerp(a.bodyLight, b.bodyLight, t)!,
      scaffoldBackground: Color.lerp(
        a.scaffoldBackground,
        b.scaffoldBackground,
        t,
      )!,
      divider: Color.lerp(a.divider, b.divider, t)!,
    );
  }
}
