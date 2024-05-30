import 'package:coach_fakka_app/models/coach_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoachNetworkHandler {
  static String baseurl = "http://localhost:3000";

  static Future<CoachModel> fetchData(
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

  static Future<List<CoachModel>> fetchDataList(
    String endpoint,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse.map((coachs) => CoachModel.fromJson(coachs)).toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  static Future<String> postData(
    String endpoint,
    CoachModel coach,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(coach);
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('Data Sending Success.');
      return response.body;
    } else {
      print('Data: ${response.statusCode}');
      return 'Failed to send data';
    }
  }
}
