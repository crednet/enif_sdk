mixin Validator {
  // Regular expression for valid email name@domain.com
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  String? emailValidator(String? email, [bool allowEmpty = false]) {
    String e = email?.trim() ?? '';
    if (e.isEmpty) {
      return allowEmpty ? null : '* Please enter email';
    } else if (!_emailRegExp.hasMatch(e)) {
      return '* Please enter a valid email address';
    }
    return null;
  }
}