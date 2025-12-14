import 'package:flutter/services.dart';

class InputRestrictors {
  static final noSpaces = FilteringTextInputFormatter.deny(RegExp(r'\s'));

  static final onlyDigits = FilteringTextInputFormatter.digitsOnly;

  static final max10Digits = LengthLimitingTextInputFormatter(10);

  static final onlyLetters = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z]'),
  );
}
