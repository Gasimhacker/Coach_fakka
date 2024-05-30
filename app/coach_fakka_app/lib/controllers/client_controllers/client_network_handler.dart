import 'package:coach_fakka_app/models/client_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClinetNetworkHandler {
  static String baseurl = "http://localhost:3000";

  static Future<ClientModel> fetchData(
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

  static Future<List<ClientModel>> fetchDataList(
    String endpoint,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((client) => ClientModel.fromJson(client))
          .toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  static Future<String> postData(
    String endpoint,
    ClientModel client,
  ) async {
    final url = Uri.parse('$baseurl/$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(client);
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
