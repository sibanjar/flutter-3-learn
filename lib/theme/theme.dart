import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
class TestTheme extends ThemeExtension<TestTheme>{
  final Color primaryColor, tertiaryColor, neutralColor;

  const TestTheme({
    this.primaryColor = const Color(0xFF356859),
    this.tertiaryColor = const Color(0xFFFF5722),
    this.neutralColor = const Color(0xFFFFFBE6)
});

  Scheme _schema(){
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;

    return Scheme(
      primary: primary.get(40),onPrimary: primary.get(100),
      primaryContainer: primary.get(90), onPrimaryContainer: primary.get(10),
      secondary: base.secondary.get(40), onSecondary: base.secondary.get(40),
      secondaryContainer: base.secondary.get(90), onSecondaryContainer: base.secondary.get(10),
      tertiary: tertiary.get(40), onTertiary: tertiary.get(100),
      tertiaryContainer: tertiary.get(90),onTertiaryContainer: tertiary.get(10),
      error: base.error.get(40), onError: base.error.get(100),
      errorContainer: base.error.get(90), onErrorContainer: base.error.get(10),
      background: neutral.get(99), onBackground: neutral.get(10),
      surface: neutral.get(99), onSurface: neutral.get(10),
      outline: base.neutralVariant.get(50), outlineVariant: base.neutralVariant.get(80),
      surfaceVariant: base.neutralVariant.get(90),
      onSurfaceVariant: base.neutralVariant.get(30),
      shadow: neutral.get(0), scrim: neutral.get(0),
      inverseSurface: neutral.get(20), inverseOnSurface: neutral.get(95),
      inversePrimary: primary.get(80),
    );
  }
  ColorScheme toColorScheme(Brightness brightness) {
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;
    return ColorScheme(
        brightness: brightness,
        primary: primaryColor,
        onPrimary: Color(primary.get(100)),
        secondary: Color(base.secondary.get(40)),
        onSecondary: Color(base.secondary.get(40)),
        error: Color(base.error.get(40)),
        onError: Color(base.error.get(100)),
        background: Color(neutral.get(99)),
        onBackground: Color(neutral.get(10)),
        surface: Color(neutral.get(99)),
        onSurface: Color(neutral.get(10)),
    );
  }

  ThemeData _base(ColorScheme colorScheme){
    final isLight = colorScheme.brightness == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
    );
  }

  ThemeData toThemeData(){
    final colorScheme = toColorScheme(Brightness.light);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }


  @override
  ThemeExtension<TestTheme> copyWith({
   Color? primaryColor,
   Color? tertiaryColor,
   Color? neutralColor,
  })=>TestTheme(
    primaryColor: primaryColor ?? this.primaryColor,
    tertiaryColor: tertiaryColor ?? this.tertiaryColor,
    neutralColor: neutralColor ?? this.neutralColor,
  );

  // https://www.youtube.com/watch?v=7nrhTdS7dHg
  // for animation
  @override
  ThemeExtension<TestTheme> lerp(covariant ThemeExtension<TestTheme>? other, double t) {
    if (other is! TestTheme) return this;
    return TestTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}