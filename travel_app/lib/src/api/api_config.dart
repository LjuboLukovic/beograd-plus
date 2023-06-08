import 'package:http/http.dart' as http;
import '../constants.dart';

Future<http.Response> fetchConfig(String fileName) {
  return http.get(Uri.parse('${API_BASE_URL}${fileName}'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'});
}

