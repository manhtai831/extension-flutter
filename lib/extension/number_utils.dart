import 'package:intl/intl.dart';

extension NumberUtils on num {
  String formatIt() {
    return NumberFormat.decimalPattern().format(this);
  }

  String formatTo(String pattern) {
    return NumberFormat(pattern).format(this);
  }

  int digits() {
    return NumberFormat.numberOfIntegerDigits(this);
  }
}
