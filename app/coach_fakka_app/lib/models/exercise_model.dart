class ExerciseModel {
  String id;
  final String name;
  final String description;
  final String video;

  ExerciseModel(
    this.id, {
    required this.name,
    required this.description,
    required this.video,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      json['id'],
      name: json['name'],
      description: json['description'],
      video: json['video'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'id': id,
      'video': video,
    };
  }
}
