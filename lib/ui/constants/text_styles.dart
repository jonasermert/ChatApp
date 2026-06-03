import 'package:flutter/material.dart';

@immutable
class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  final TextStyle xs;
  final TextStyle sm;
  final TextStyle standard;
  final TextStyle lg;
  final TextStyle xl;
  final TextStyle xxl;
  final TextStyle xxxl;

  const CustomTextStyles({
    this.xs = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
    this.sm = const TextStyle(fontSize: 14.0),
    this.standard = const TextStyle(fontSize: 16.0),
    this.lg = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    this.xl = const TextStyle(fontSize: 20.0),
    this.xxl = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    this.xxxl = const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
  });

  @override
  CustomTextStyles copyWith({
    TextStyle? xs,
    TextStyle? sm,
    TextStyle? standard,
    TextStyle? lg,
    TextStyle? xl,
    TextStyle? xxl,
    TextStyle? xxxl,
  }) {
    return CustomTextStyles(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      standard: standard ?? this.standard,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      xxxl: xxxl ?? this.xxxl,
    );
  }

  @override
  CustomTextStyles lerp(ThemeExtension<CustomTextStyles>? other, double t) {
    if (other is! CustomTextStyles) return this;
    return CustomTextStyles(
      xs: TextStyle.lerp(xs, other.xs, t)!,
      sm: TextStyle.lerp(sm, other.sm, t)!,
      standard: TextStyle.lerp(standard, other.standard, t)!,
      lg: TextStyle.lerp(lg, other.lg, t)!,
      xl: TextStyle.lerp(xl, other.xl, t)!,
      xxl: TextStyle.lerp(xxl, other.xxl, t)!,
      xxxl: TextStyle.lerp(xxxl, other.xxxl, t)!,
    );
  }
}
