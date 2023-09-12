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

  Color get backgroundColor =>
      isDark ? const Color(0xff1a1a1a) : const Color(0xffF4F2F8);
  Color get textColor =>
      isDark ? Colors.white.withOpacity(.85) : const Color(0xff2a2a2a);
}

extension DateExt on DateTime {
  String get time {
    var date = this;
    int hour = date.hour;
    int minute = this.minute;
    return _formatTime(hour, minute);
  }

  String _formatTime(int hour, int min) {
    String m = '$min';
    if (min < 10) m = '0$min';
    if (hour < 10) {
      return '0$hour:$min AM';
    } else if (hour < 13) {
      if (hour == 12 && min == 0) return '$hour:00 NOON';
      if (hour == 12) return '$hour:$min PM';
      return '$hour:$min AM';
    } else {
      return '${hour - 12}:$m PM';
    }
  }
}
