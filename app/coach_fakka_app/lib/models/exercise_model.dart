class ExerciseModel {
  String? id;
  String? name;
  String? description;
  String? link;

  ExerciseModel({
    this.id,
    this.name,
    this.description,
    this.link,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'id': id,
      'link': link,
    };
  }
}
