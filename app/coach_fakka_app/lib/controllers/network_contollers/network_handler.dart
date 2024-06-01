import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHandler {
  static String baseurl = "http://coolscientist.tech/Coachfakkah/api/v1";

  static Future<String> fetchData(
    String endpoint,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  static Future<String> postData(
    String endpoint,
    dynamic coach,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(coach);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('Data Sending Success.');
      return response.body;
    } else {
      print('Error Code   : ${response.statusCode}');
      print('Error message: ${response.body}');
      return 'Failed to send data';
    }
  }
}

  // static Future<List> fetchDataList(
  //   String endpoint,
  // ) async {
  //   final url = Uri.parse('$baseurl/$endpoint');

  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((coachs) => CoachModel.fromJson(coachs)).toList();
  //   } else {
  //     throw Exception('Failed to load workouts');
  //   }
  // }