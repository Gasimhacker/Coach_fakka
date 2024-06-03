import 'dart:convert';
import 'package:coach_fakka_app/controllers/network_controllers/network_handler.dart';
import 'package:coach_fakka_app/models/workout_model.dart';

class WorkoutAPIHandler {
  static Future<List<WorkoutModel>> getMyWorkouts(String clientId) async {
    String endPoint = '${clientId}/workouts/';
    String response = await NetworkHandler.fetchData(endPoint);
    List<dynamic> coaches = json.decode(response);
    return coaches.map((workout) => WorkoutModel.fromJson(workout)).toList();
  }

  static Future<WorkoutModel> creatWorkout(
      String clientId, WorkoutModel newWorkout) async {
    String endPoint = '${clientId}/workouts/';
    String response = await NetworkHandler.postData(endPoint, newWorkout);
    return WorkoutModel.fromJson(json.decode(response));
  }
}
