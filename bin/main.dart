import 'package:extension_mt/date_utils.dart';

void main() {
  print('12/12/2021'.toDateTime(DatePattern.DMY));
  print('12/12/2021'.toNewFormat(DatePattern.DMY, DatePattern.DMY_HMS));
  print(DateTime.now().toFormat(DatePattern.DMY_HMS));
}
