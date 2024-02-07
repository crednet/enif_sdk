import 'package:flutter/material.dart';

extension NumExt on num {
  BorderRadius get toBorderRadius => BorderRadius.circular(toDouble());

  /// a spacer widget
  Spacer get s => const Spacer();

  /// convert a double field to SizedBox with its height
  SizedBox get h => SizedBox(height: toDouble());

  /// convert a double field to SizedBox with its widget
  SizedBox get w => SizedBox(width: toDouble());
}

extension BuildContextExt on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// caption text style same as [Theme.of(this).textTheme.caption]
  TextStyle? get caption => Theme.of(this).textTheme.bodySmall;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  /// headline5 text style same as [Theme.of(this).textTheme.headline5]
  TextStyle? get headline5 => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headline6 => Theme.of(this)
      .textTheme
      .headlineSmall
      ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600);

  /// headline4 text style same as [Theme.of(this).textTheme.headline4]
  TextStyle? get headline4 => Theme.of(this).textTheme.headlineMedium;

  /// headline5 text style same as [Theme.of(this).textTheme.headline3]
  TextStyle? get headline3 => Theme.of(this).textTheme.headlineLarge;

  /// bodyText1 text style same as [Theme.of(this).textTheme.bodyText1]
  TextStyle? get bodyText1 => Theme.of(this).textTheme.bodyMedium;

  InputDecorationTheme? get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
  BorderSide? get borderSide => inputDecorationTheme?.border?.borderSide;

  /// bodyText2 text style same as [Theme.of(this).textTheme.bodyText2]
  TextStyle? get bodyText2 => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get subtitle1 => Theme.of(this).textTheme.titleSmall;
  TextStyle? get subtitle2 => Theme.of(this).textTheme.titleSmall;
  TextStyle? get overline => Theme.of(this).textTheme.titleSmall;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  // isDark ? const Color(0xff1a1a1a) : const Color(0xffF4F2F8);
  Color get textColor =>
      isDark ? Colors.white.withOpacity(.85) : const Color(0xff2a2a2a);
}

extension Str on String {
  // capitalize first letter of a every word in a string
  String toTitleCase() {
    List<String> s = toLowerCase().split(' ');
    String result = '';
    for (var e in s) {
      if (e.isNotEmpty && e.isNotEmpty) {
        result += e.replaceRange(0, 1, e[0].toUpperCase());
        result += ' ';
      }
    }
    return result.trim();
  }
}
