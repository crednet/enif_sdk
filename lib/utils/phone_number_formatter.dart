import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final RegExp numberRegExp = RegExp(r'^\d+$'); // RegExp fto validate numbers
  final int maxLength;

  PhoneNumberFormatter({this.maxLength = 11});
  int position = 0;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = sanitizeNumber(newValue.text);

    // if(text.length >= maxLength)p

    if (newValue.selection.baseOffset == 0) return newValue;
    position = newValue.selection.baseOffset;
    text = formatText(text) ?? '';

    // print(
    //     'offset $position ${newValue.selection.baseOffset} ${text.length} $text');
    if (newValue.selection.baseOffset < text.length - 1) {
      position = newValue.selection.baseOffset;
    }
    return newValue.copyWith(
        // composing: TextRange.collapsed(13),
        text: text,
        selection: TextSelection.fromPosition(TextPosition(offset: position)));
  }

  String? formatText(String text) {
    // if (text == null) return null;
    text = sanitizeNumber(text);
    int startOffset = 2;
    position = 0;
    var buffer = StringBuffer();
    if (text[0] == '0') startOffset = 3;
    for (int i = 0; i < text.length; i++) {
      if (numberRegExp.hasMatch(text[i])) {
        //&&
        // ((startOffset == 2 && i < 12) || startOffset == 3)) {
        position++;
        buffer.write(text[i]);
      }
      if ((i == startOffset ||
              i == startOffset + 4 ||
              i == startOffset + 8 ||
              (startOffset == 2 && i == startOffset + 9)) &&
          i != text.length - 1) {
        position++;
        buffer.write(' ');
      }
    }
    return buffer.toString().trim();
  }

  /// remove characters from number
  String sanitizeNumber(String number) {
    String? text = number.trim();
    // text = text.replaceAll(RegExp(r'^\d+$'), '');
    text = text.replaceAll('-', '');
    text = text.replaceAll('(', '');
    text = text.replaceAll(')', '');
    text = text.replaceAll(' ', '');
    return text;
  }
}
