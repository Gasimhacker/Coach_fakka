class WorkoutModel {
  final String? id;
  final String? name;
  final String? note;
  final DateTime? creatdAt;
  final String? coachId;
  final String? client_id;
  bool? done = false;

  WorkoutModel(
      {this.id,
      this.name,
      this.note,
      this.creatdAt,
      this.coachId,
      this.client_id,
      this.done});

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      name: json['name'],
      note: json['note'],
      creatdAt: json['creatdAt'],
      client_id: json['client_id'],
      coachId: json['coachId'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coachId': coachId,
        'client_id': client_id,
        'note': note,
        'creatdAt': creatdAt,
        'done': done,
      };
}
