import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/workout_model.dart';
import 'package:flutter/material.dart';

void main() async {
  String coachId = '3e2cafa9-6895-47c6-967c-b9048a97a5d8';
  String AhmdId = 'f5e23672-b827-49bd-a7ca-bd0d0d056872';

  List<WorkoutModel> cw = await WorkoutAPIHandler.getMyWorkouts(AhmdId);

  cw.forEach((element) {
    print(element.name);
  });
}
