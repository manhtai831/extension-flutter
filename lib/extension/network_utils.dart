import 'dart:convert';
import 'dart:io';
import 'package:extension_mt/extension/post.dart';
import 'package:http/http.dart' as http;

class NetWorkUtils {
  static Future<Map> fetchPost({http.Client? client}) async {
    if (client == null) client = http.Client();
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // Ngược lại sẽ throw Exception
      throw Exception('Failed to load post');
    }
  }
}
