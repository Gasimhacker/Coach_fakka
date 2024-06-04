class CoachModel {
  String? id;
  String? name;
  String? email;
  String? password = '123456';

  CoachModel({this.id, this.name, this.email});

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
      };
}
