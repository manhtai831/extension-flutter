import 'string_utils.dart';
import 'dart:io';
import 'dart:convert';

extension Base64Utils on dynamic {
  static String? convertImageToBase64(String? path) {
    if (path != null) {
      int at = path.split('.').length - 1;
      String extension = path.getChartAt(at, '.');
      try {
        final bytes = File(path).readAsBytesSync();
        String base64Image =
            "data:image/$extension;base64," + base64Encode(bytes);
        return base64Image;
      } catch (e) {
        print(e);
        return null;
      }
    } else {
      return null;
    }
  }
}
