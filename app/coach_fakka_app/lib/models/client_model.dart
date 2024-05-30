import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class ClientModel {
  String? name;
  String? id;
  String? coachId;
  String? email;
  String? age;
  String? Gender;
  Double? weight;
  int? height;
  double? goalWeight;
  String? traiiingPlace;
  int? traiangDays;
  double? traiangHours;
  int? activityLevel;
  bool? needSupplement;
  String? injuryHistory;

  ClientModel({
    this.name,
    this.email,
    this.Gender,
    this.age,
    this.weight,
    this.height,
    this.goalWeight,
    this.traiiingPlace,
    this.traiangDays,
    this.traiangHours,
    this.activityLevel,
    this.needSupplement,
    this.injuryHistory,
    this.coachId,
    this.id,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        name: json["name"],
        email: json["email"],
        id: json["id"],
        coachId: json["coachId"],
        age: json["age"],
        weight: json["weight"],
        height: json["height"],
        goalWeight: json["goalWeight"],
        traiiingPlace: json["traiiingPlace"],
        traiangDays: json["traiangDays"],
        traiangHours: json["traiangHours"],
        activityLevel: json["activityLevel"],
        needSupplement: json["needSupplement"],
        injuryHistory: json["injuryHistory"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "id": id,
        "coachId": coachId,
        "age": age,
        "weight": weight,
        "height": height,
        "goalWeight": goalWeight,
        "traiiingPlace": traiiingPlace,
        "traiangDays": traiangDays,
        "traiangHours": traiangHours,
        "activityLevel": activityLevel,
        "needSupplement": needSupplement,
        "injuryHistory": injuryHistory,
      };

  static Future<List<ClientModel>> fetchAll() async {
    final url = Uri.parse('http://localhost:3000/coaches');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((coach) => ClientModel.fromJson(coach)).toList();
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
