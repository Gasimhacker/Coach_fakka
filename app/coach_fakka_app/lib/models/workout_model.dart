import 'dart:convert';
import 'package:http/http.dart' as http;

class WorkoutModel {
  final String? id;
  final String? name;
  final String? note;
  final DateTime? creatdAt;
  final String? coachId;
  final String? clientId;

  WorkoutModel(
      {this.id,
      this.name,
      this.note,
      this.creatdAt,
      this.coachId,
      this.clientId});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      name: json['name'],
      note: json['note'],
      creatdAt: json['creatdAt'],
      clientId: json['clientId'],
      coachId: json['coachId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coachId': coachId,
        'clientId': clientId,
        'note': note,
        'creatdAt': creatdAt,
      };

  static Future<List<WorkoutModel>> fetchAll() async {
    final url = Uri.parse('http://localhost:3000/workouts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((workout) => WorkoutModel.fromJson(workout))
          .toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  Future<void> postData() async {
    final url = Uri.parse('http://example.com/api/endpoint');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'name': 'John Doe', 'email': 'john@example.com'});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Data Sending Success.');
    } else {
      print('Hata: ${response.statusCode}');
    }
  }
}
