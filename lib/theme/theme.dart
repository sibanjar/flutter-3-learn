import 'package:flutter/material.dart';

@immutable
class TestTheme extends ThemeExtension<TestTheme>{
  final Color primaryColor, tertiaryColor, neutralColor;

  const TestTheme( {
    this.primaryColor = const Color(0xFF356859),
    this.tertiaryColor = const Color(0xFFFF5722),
    this.neutralColor = const Color(0xFFFFFBE6)
});

  ThemeData toThemeData(){
    return ThemeData(useMaterial3:true);
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