import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHandler {
  static String baseurl = "http://localhost:3000";

  Future<dynamic> fetchData(
    String endpoint,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  Future<void> postData(
    String endpoint,
    dynamic data,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(data);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('Data Sending Success.');
      return json.decode(response.body);
    } else {
      print('Data: ${response.statusCode}');
    }
  }
}
