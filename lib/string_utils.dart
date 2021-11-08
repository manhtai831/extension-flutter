import 'dart:ui';

import 'package:flutter/material.dart';

extension StringUtils on String? {
  /// Lấy giá trị đầu tiên của chuỗi
  String getFirstChart() {
    if (this!.isNotEmpty) {
      return this![0];
    } else {
      return '';
    }
  }

  ///Kiểm tra string là username
  bool isUsername() =>
      hasMatch(this, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');

  /// kiểm tra string là tiền
  bool isCurrency() => hasMatch(this,
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  /// kiểm tra string là số điện thoại
  bool isPhoneNumber() {
    if (this!.length > 16 || this!.length < 9) return false;
    return hasMatch(this, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Kiểm tra string là email
  bool isEmail() => hasMatch(this,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Kiểm tra string là html file
  bool isHTML(String filePath) {
    return filePath.toLowerCase().endsWith(".html");
  }

  /// Kiểm tra string là video file
  bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  /// Kiểm tra string là audio file
  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  /// Kiểm tra string là image file
  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  // Kiểm tra string là 1 số nguyên
  bool isNumericOnly() => hasMatch(this, r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool isAlphabetOnly() => hasMatch(this, r'^[a-zA-Z]+$');

  /// Kiểm tra string tất cả là chữ hoa
  bool hasCapitalletter() => hasMatch(this, r'[A-Z]');

  Size get getTextSize {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this),
      maxLines: 1,
    )..layout(
        minWidth: 0,
        maxWidth: double.infinity,
      );
    return textPainter.size;
  }

  bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  /*--------------------------------------------------------------------------*/
  bool equalsIgnoreCase(String? other) =>
      (other == null) || (this!.toLowerCase() == other.toLowerCase());

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  ///  Replace part of string after the first occurrence of given delimiter with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [defaultValue] which defaults to the original string.
  String? replaceAfter(String delimiter, String replacement,
      [String? defaultValue = '']) {
    if (this == null) return null;
    final index = this!.indexOf(delimiter);
    return (index == -1)
        ? defaultValue!.isEmptyOrNull
            ? this
            : defaultValue
        : this!.replaceRange(index + 1, this!.length, replacement);
  }

  ///
  /// Replace part of string before the first occurrence of given delimiter with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [missingDelimiterValue?] which defaults to the original string.
  String? replaceBefore(String delimiter, String replacement,
      [String? defaultValue]) {
    if (this == null) return null;
    final index = this!.indexOf(delimiter);
    return (index == -1)
        ? defaultValue.isEmptyOrNull
            ? this
            : defaultValue
        : this!.replaceRange(0, index, replacement);
  }

  /// prints to console this text if it's not empty or null
  void printThis() {
    if (isEmptyOrNull) return;
    print('MANHTAI --> ' + toString());
  }

  /// Parses the string as an double or returns `null` if it is not a number.
  double? toDoubleOrNull() => this == null ? null : double.tryParse(this!);

  /// Parses the string as an int or returns `null` if it is not a number.
  int? toIntOrNull() => this == null ? null : int.tryParse(this!);

  /// Returns a String without white space at all
  String? removeAllWhiteSpace() =>
      this.isEmptyOrNull ? null : this!.replaceAll(RegExp(r"\s+\b|\b\s"), "");
}
