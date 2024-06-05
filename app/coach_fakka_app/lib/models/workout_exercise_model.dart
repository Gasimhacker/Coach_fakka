class WorkoutExerciseModel {
  String? id;
  String? workout_id;
  String? exercise_id;
  int? sets;
  int? restTime;
  int? reps;
  int? rpe;
  int? weight;
  bool? done;
  bool? warm_up;

  WorkoutExerciseModel({
    this.id,
    this.workout_id,
    this.exercise_id,
    this.sets,
    this.reps,
    this.weight,
    this.restTime,
    this.rpe,
    this.done,
    this.warm_up,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
      id: json['id'],
      workout_id: json['workout_id '],
      exercise_id: json['exercise_id'],
      sets: json['sets'],
      restTime: json['restTime'],
      reps: json['reps'],
      weight: json['weight'],
      rpe: json['rpe'],
      done: json['done'],
      warm_up: json['warm_up'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workout_id ': workout_id,
      'exercise_id': exercise_id,
      'sets': sets,
      'reps': reps,
      'weight': weight,
      'restTime': restTime,
      'rpe': rpe,
      'done': done,
      'warm_up': warm_up,
    };
  }
}
