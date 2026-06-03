import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class CustomBreakpoints extends ThemeExtension<CustomBreakpoints> {
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  const CustomBreakpoints({
    this.sm = 640.0,
    this.md = 768.0,
    this.lg = 1024.0,
    this.xl = 1280.0,
    this.xxl = 1536.0,
  });

  @override
  CustomBreakpoints copyWith({
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return CustomBreakpoints(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  CustomBreakpoints lerp(ThemeExtension<CustomBreakpoints>? other, double t) {
    if (other is! CustomBreakpoints) return this;
    return CustomBreakpoints(
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      xxl: lerpDouble(xxl, other.xxl, t)!,
    );
  }
}
