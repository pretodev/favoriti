part of './styles.dart';

@immutable
class ColorStyles {
  factory ColorStyles.main() {
    return ColorStyles(
      primary: const Color(0xFFF37A20),
      heading: const Color(0xFF5EC401),
      body: const Color(0xFF37474F),
      bodyLight: const Color(0xA637474F),
      scaffoldBackground: const Color(0xFFFBFCFF),
      divider: const Color(0xFFF0F0F0),
      inputBackground: const Color(0xFFF0F1F2),
    );
  }

  const ColorStyles({
    required this.primary,
    required this.heading,
    required this.body,
    required this.bodyLight,
    required this.scaffoldBackground,
    required this.divider,
    required this.inputBackground,
  });

  final Color primary;
  final Color heading;

  final Color body;
  final Color bodyLight;

  final Color scaffoldBackground;

  final Color divider;

  final Color inputBackground;

  static ColorStyles? lerp(ColorStyles? a, ColorStyles? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ColorStyles(
      primary: Color.lerp(a!.primary, b!.primary, t)!,
      heading: Color.lerp(a.heading, b.heading, t)!,
      body: Color.lerp(a.body, b.body, t)!,
      bodyLight: Color.lerp(a.bodyLight, b.bodyLight, t)!,
      scaffoldBackground: Color.lerp(
        a.scaffoldBackground,
        b.scaffoldBackground,
        t,
      )!,
      divider: Color.lerp(a.divider, b.divider, t)!,
      inputBackground: Color.lerp(a.inputBackground, b.inputBackground, t)!,
    );
  }
}
