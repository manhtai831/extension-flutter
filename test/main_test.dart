import 'package:extension_mt/extension/base64_utils.dart';
import 'package:extension_mt/extension/mt_utils.dart';
import 'package:extension_mt/extension/network_utils.dart';
import 'package:extension_mt/extension/post.dart';
import 'package:http/http.dart' as network;
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements network.Client {}

void main() {
  test('TestTime1', () {
    print(RegExp(r'^[a-zA-Z0-9._\\s@]+$').hasMatch('manh_.tai'));
    print(11231231213.formatTo('#,###'));
    print(11231231213.digits());
    String s = '';
    for (int i = 0; i < 10; i++) {
      s.append('$i', ', ');
    }
    s.build().printThis();
    '123.213.123.123'.remove(['\.', '1', '2']).printThis();

    'https://abc.xyz'.getChartAt(1, '.').printThis();
    expect(2, 2, reason: 'Gà');
  });
}
