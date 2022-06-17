import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<http.Response> getData() async {
    final response = await http.get(Uri.parse(url));
    var data = response.body;
    return json.decode(data);
  }
}
