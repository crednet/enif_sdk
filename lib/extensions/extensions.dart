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
