class WorkoutExerciseModel {
  final String? id;
  final String? workoutId;
  final String? exerciseId;
  final int? sets;
  final int? restTime;
  final int? reps;
  final int? rpe;
  final int? weight;
  final bool? done;

  WorkoutExerciseModel({
    this.id,
    this.workoutId,
    this.exerciseId,
    this.sets,
    this.reps,
    this.weight,
    this.restTime,
    this.rpe,
    this.done,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
      id: json['id'],
      workoutId: json['workoutId'],
      exerciseId: json['exerciseId'],
      sets: json['sets'],
      restTime: json['restTime'],
      reps: json['reps'],
      weight: json['weight'],
      rpe: json['rpe'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workoutId': workoutId,
      'exerciseId': exerciseId,
      'sets': sets,
      'reps': reps,
      'weight': weight,
      'restTime': restTime,
      'rpe': rpe,
      'done': done,
    };
  }
}
