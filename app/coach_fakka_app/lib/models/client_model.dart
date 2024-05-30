import 'dart:ffi';

class ClientModel {
  String? name;
  String? id;
  String? coachId;
  String? email;
  int? age;
  String? Gender;
  double? weight;
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
}
