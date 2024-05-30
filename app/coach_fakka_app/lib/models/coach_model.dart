import 'dart:convert';
import 'package:http/http.dart' as http;

class CoachModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  CoachModel({this.id, this.name, this.email, this.phone, this.address});

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      };

  static Future<List<CoachModel>> fetchAll() async {
    final url = Uri.parse('http://localhost:3000/coaches');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((coach) => CoachModel.fromJson(coach)).toList();
    } else {
      throw Exception('Failed to load coaches');
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
