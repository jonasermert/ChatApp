import 'package:flutter/material.dart';

@immutable
class CustomShadows extends ThemeExtension<CustomShadows> {
  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;
  final List<BoxShadow> xl;
  final List<BoxShadow> xxl;

  static const _colorBase = Color.fromRGBO(0, 0, 0, 0.1);
  static const _colorMd = Color.fromRGBO(0, 0, 0, 0.1);
  static const _colorMdAlt = Color.fromRGBO(0, 0, 0, 0.06);
  static const _colorLg = Color.fromRGBO(0, 0, 0, 0.1);
  static const _colorLgAlt = Color.fromRGBO(0, 0, 0, 0.05);
  static const _colorXl = Color.fromRGBO(0, 0, 0, 0.1);
  static const _colorXlAlt = Color.fromRGBO(0, 0, 0, 0.05);
  static const _color2xl = Color.fromRGBO(0, 0, 0, 0.25);

  const CustomShadows({
    this.sm = const [
      BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: _colorBase),
    ],
    this.md = const [
      BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 6,
        spreadRadius: -1,
        color: _colorMd,
      ),
      BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        spreadRadius: -1,
        color: _colorMdAlt,
      ),
    ],
    this.lg = const [
      BoxShadow(
        offset: Offset(0, 10),
        blurRadius: 15,
        spreadRadius: -3,
        color: _colorLg,
      ),
      BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 6,
        spreadRadius: -2,
        color: _colorLgAlt,
      ),
    ],
    this.xl = const [
      BoxShadow(
        offset: Offset(0, 20),
        blurRadius: 25,
        spreadRadius: -5,
        color: _colorXl,
      ),
      BoxShadow(
        offset: Offset(0, 10),
        blurRadius: 10,
        spreadRadius: -5,
        color: _colorXlAlt,
      ),
    ],
    this.xxl = const [
      BoxShadow(
        offset: Offset(0, 25),
        blurRadius: 50,
        spreadRadius: -12,
        color: _color2xl,
      ),
    ],
  });

  @override
  CustomShadows copyWith({
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
    List<BoxShadow>? xl,
    List<BoxShadow>? xxl,
  }) {
    return CustomShadows(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  CustomShadows lerp(ThemeExtension<CustomShadows>? other, double t) {
    if (other is! CustomShadows) return this;
    return CustomShadows(
      sm: BoxShadow.lerpList(sm, other.sm, t) ?? sm,
      md: BoxShadow.lerpList(md, other.md, t) ?? md,
      lg: BoxShadow.lerpList(lg, other.lg, t) ?? lg,
      xl: BoxShadow.lerpList(xl, other.xl, t) ?? xl,
      xxl: BoxShadow.lerpList(xxl, other.xxl, t) ?? xxl,
    );
  }
}
