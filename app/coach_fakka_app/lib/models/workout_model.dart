import 'dart:convert';
import 'package:http/http.dart' as http;

class WorkoutModel {
  final String? id;
  final String? name;
  final String? description;
  final String? duration;
  final String? calories;
  final String? coachId;

  WorkoutModel(
      {this.id,
      this.name,
      this.description,
      this.duration,
      this.calories,
      this.coachId});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      calories: json['calories'],
      coachId: json['coachId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'duration': duration,
        'calories': calories,
        'coachId': coachId,
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
