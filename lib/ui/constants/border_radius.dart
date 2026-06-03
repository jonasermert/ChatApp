import 'package:flutter/material.dart';

@immutable
class CustomBorderRadius extends ThemeExtension<CustomBorderRadius> {
  final BorderRadius none;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius xxl;
  final BorderRadius xxxl;
  final BorderRadius full;

  const CustomBorderRadius({
    this.none = BorderRadius.zero,
    this.sm = const BorderRadius.all(Radius.circular(2.0)),
    this.md = const BorderRadius.all(Radius.circular(4.0)),
    this.lg = const BorderRadius.all(Radius.circular(6.0)),
    this.xl = const BorderRadius.all(Radius.circular(8.0)),
    this.xxl = const BorderRadius.all(Radius.circular(12.0)),
    this.xxxl = const BorderRadius.all(Radius.circular(16.0)),
    this.full = const BorderRadius.all(Radius.circular(9999.0)),
  });

  @override
  CustomBorderRadius copyWith({
    BorderRadius? none,
    BorderRadius? sm,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
    BorderRadius? xxl,
    BorderRadius? xxxl,
    BorderRadius? full,
  }) {
    return CustomBorderRadius(
      none: none ?? this.none,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      xxxl: xxxl ?? this.xxxl,
      full: full ?? this.full,
    );
  }

  @override
  CustomBorderRadius lerp(ThemeExtension<CustomBorderRadius>? other, double t) {
    if (other is! CustomBorderRadius) return this;
    return CustomBorderRadius(
      none: BorderRadius.lerp(none, other.none, t)!,
      sm: BorderRadius.lerp(sm, other.sm, t)!,
      md: BorderRadius.lerp(md, other.md, t)!,
      lg: BorderRadius.lerp(lg, other.lg, t)!,
      xl: BorderRadius.lerp(xl, other.xl, t)!,
      xxl: BorderRadius.lerp(xxl, other.xxl, t)!,
      xxxl: BorderRadius.lerp(xxxl, other.xxxl, t)!,
      full: BorderRadius.lerp(full, other.full, t)!,
    );
  }
}
