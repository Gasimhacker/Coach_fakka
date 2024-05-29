class Exercise {
  final String id;
  final String name;
  final String description;
  final String video;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.video,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      description: json['description'],
      id: json['id'],
      video: json['video'],
    );
  }
}
