class Exercise {
  String id;
  final String name;
  final String description;
  final String video;

  Exercise(
    this.id, {
    required this.name,
    required this.description,
    required this.video,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
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
