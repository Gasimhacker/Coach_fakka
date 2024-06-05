class ExerciseModel {
  String id;
  String name;
  String description;
  String link;

  ExerciseModel(
    this.id, {
    required this.name,
    required this.description,
    required this.link,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      json['id'],
      name: json['name'],
      description: json['description'],
      link: json['link '],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'id': id,
      'link ': link,
    };
  }
}
