part of './styles.dart';

@immutable
class TextStyles {
  factory TextStyles.main() {
    return TextStyles(
      appTitle: GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  const TextStyles({
    required this.appTitle,
    required this.headlineMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
  });

  final TextStyle appTitle;

  final TextStyle headlineMedium;

  final TextStyle titleSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;

  static TextStyles? lerp(TextStyles? a, TextStyles? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return TextStyles(
      appTitle: TextStyle.lerp(a!.appTitle, b!.appTitle, t)!,
      headlineMedium: TextStyle.lerp(a.headlineMedium, b.headlineMedium, t)!,
      titleSmall: TextStyle.lerp(a.titleSmall, b.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(a.bodyLarge, b.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(a.bodyMedium, b.bodyMedium, t)!,
    );
  }
}
