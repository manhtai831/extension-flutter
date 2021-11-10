import 'package:extension_mt/extension/mt_utils.dart';
import 'package:intl/intl.dart';

void main() {
  print(RegExp(r'^[a-zA-Z0-9._\\s@]+$').hasMatch('manh_.tai'));
  print(11231231213.formatTo('#,###'));
  print(11231231213.digits());
  String s = '';
  for (int i = 0; i < 10; i++) {
    s.append('$i', ', ');
  }
  s.build().printThis();
  '123.213.123.123'.remove(['\.', '1', '2']).printThis();
}
