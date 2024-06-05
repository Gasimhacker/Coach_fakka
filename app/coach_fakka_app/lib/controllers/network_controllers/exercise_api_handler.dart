import 'dart:convert';
import 'package:coach_fakka_app/controllers/network_controllers/network_handler.dart';
import 'package:coach_fakka_app/models/exercise_model.dart';

class ExerciseAPIHandler {
  static Future<ExerciseModel> createNewExercise(
      ExerciseModel newExercise, String coachId) async {
    String endPoint = '${coachId}/exercises';
    String response = await NetworkHandler.postData(endPoint, newExercise);
    return ExerciseModel.fromJson(json.decode(response));
  }

  static Future<List<ExerciseModel>> getAllExercises(String coachId) async {
    String endPoint = '${coachId}/exercises';
    String response = await NetworkHandler.fetchData(endPoint);
    List<dynamic> coaches = json.decode(response);
    return coaches.map((coach) => ExerciseModel.fromJson(coach)).toList();
  }
}
