class ClientModel {
  String? name;
  String? id;
  String? coach_id;
  String? email;
  String? gender = 'MALE';
  String? training_place;
  String? injury_history = 'None';
  int? training_days = 0;
  int? activity_level = 1;
  int? age = 1;
  int? training_hours;
  double? height = 0;
  double? weight;
  double? goal_weight;
  bool? need_supplements = false;

  ClientModel({
    this.name,
    this.id,
    this.coach_id,
    this.email,
    this.gender,
    this.training_place,
    this.injury_history,
    this.training_days,
    this.activity_level,
    this.age,
    this.height,
    this.weight,
    this.goal_weight,
    this.training_hours,
    this.need_supplements,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        name: json["name"],
        id: json["id"],
        coach_id: json["coach_id"],
        email: json["email"],
        gender: json["gender"],
        training_place: json["training_place"],
        injury_history: json["injury_history"],
        training_days: json["training_days"],
        activity_level: json["activity_level"],
        age: json["age"],
        height: json["height"],
        weight: json["weight"],
        goal_weight: json["goal_weight"],
        training_hours: json["training_hours"],
        need_supplements: json["need_supplements"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "coach_id": coach_id,
        "email": email,
        "gender": gender,
        "training_place": training_place,
        "injury_history": injury_history,
        "training_days": training_days,
        "activity_level": activity_level,
        "age": age,
        "height": height,
        "weight": weight,
        "goal_weight": goal_weight,
        "training_hours": training_hours,
        "need_supplements": need_supplements,
      };
}
