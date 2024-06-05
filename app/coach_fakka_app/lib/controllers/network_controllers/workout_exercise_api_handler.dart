import 'dart:convert';
import 'package:coach_fakka_app/controllers/network_controllers/network_handler.dart';
import 'package:coach_fakka_app/models/workout_exercise_model.dart';

class WorkoutExerciseApiHandler {
  static Future<List<WorkoutExerciseModel>> getWorkoutExercises(
      String workoutId) async {
    String endPoint = '${workoutId}/workout_exercises';
    String response = await NetworkHandler.fetchData(endPoint);
    List<dynamic> workoutExercises = json.decode(response);
    return workoutExercises
        .map(
            (workoutExercise) => WorkoutExerciseModel.fromJson(workoutExercise))
        .toList();
  }

  static Future<WorkoutExerciseModel> createWorkoutExercise(String workoutId,
      WorkoutExerciseModel newWorkoutExercise, String exerciseId) async {
    String endPoint = '${workoutId}/workout_exercises/${exerciseId}';
    String response =
        await NetworkHandler.postData(endPoint, newWorkoutExercise);
    return WorkoutExerciseModel.fromJson(json.decode(response));
  }

  static Future<WorkoutExerciseModel> updateWorkoutExercise(String workoutId,
      WorkoutExerciseModel newWorkoutExercise, String exerciseId) async {
    String endPoint = '${workoutId}/workout_exercises/${exerciseId}';
    String response =
        await NetworkHandler.updateData(endPoint, newWorkoutExercise);
    return WorkoutExerciseModel.fromJson(json.decode(response));
  }
}
