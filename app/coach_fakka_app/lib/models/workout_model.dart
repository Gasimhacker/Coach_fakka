class WorkoutModel {
  String? id;
  String? name;
  String? note;
  String? created_at;
  String? updated_at;
  String? client_id;
  bool? done = false;
  int? number_exercises = 0;

  WorkoutModel(
      {this.id,
      this.name,
      this.note,
      this.created_at,
      this.client_id,
      this.done,
      this.number_exercises,
      this.updated_at});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      name: json['name'],
      note: json['note'],
      created_at: json['created_at'],
      client_id: json['client_id'],
      done: json['done'],
      number_exercises: json['number_exercises'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'client_id': client_id,
        'note': note,
        'created_at': created_at,
        'done': done,
        'number_exercises': number_exercises,
        'updated_at': updated_at,
      };
}
