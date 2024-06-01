class ClientModel {
  String? name;
  String? id;
  String? coachId;
  String? email;
  String? gender = 'MALE';
  String? trainningPlace;
  String? injuryHistory = 'None';
  int? traiangDays = 0;
  int? activityLevel = 0;
  int? age = 1;
  int? height = 0;
  double? weight;
  double? goalWeight;
  double? traiangHours;
  bool? needSupplement = false;

  ClientModel({
    this.name,
    this.id,
    this.coachId,
    this.email,
    this.gender,
    this.trainningPlace,
    this.injuryHistory,
    this.traiangDays,
    this.activityLevel,
    this.age,
    this.height,
    this.weight,
    this.goalWeight,
    this.traiangHours,
    this.needSupplement,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        name: json["name"],
        id: json["id"],
        coachId: json["coachId"],
        email: json["email"],
        gender: json["gender"],
        trainningPlace: json["trainningPlace"],
        injuryHistory: json["injuryHistory"],
        traiangDays: json["traiangDays"],
        activityLevel: json["activityLevel"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        goalWeight: json["goalWeight"],
        traiangHours: json["traiangHours"],
        needSupplement: json["needSupplement"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "coachId": coachId,
        "email": email,
        "gender": gender,
        "trainningPlace": trainningPlace,
        "injuryHistory": injuryHistory,
        "traiangDays": traiangDays,
        "activityLevel": activityLevel,
        "age": age,
        "height": height,
        "weight": weight,
        "goalWeight": goalWeight,
        "traiangHours": traiangHours,
        "needSupplement": needSupplement,
      };
}
