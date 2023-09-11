import 'package:flutter/cupertino.dart';

extension WidgetModifier on Widget {
  Widget addPadding(EdgeInsetsGeometry value) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}