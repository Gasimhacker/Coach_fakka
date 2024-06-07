import 'package:coach_fakka_app/controllers/network_controllers/client_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/coach_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/exercise_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/models/coach_model.dart';
import 'package:coach_fakka_app/models/exercise_model.dart';
import 'package:coach_fakka_app/models/workout_model.dart';

void main() async {
  String coachId = '3e2cafa9-6895-47c6-967c-b9048a97a5d8';
  String AhmdId = 'f5e23672-b827-49bd-a7ca-bd0d0d056872';
  String OmerId = 'fefb98ab-050d-45dc-9fac-b041509b9d2f';

  // CoachModel currentCoach = await CoachApiHandler.getCoach(coachId);
  // print('Current Coach');
  // print(currentCoach.toJson());

  // List<ClientModel> trainees = await CoachApiHandler.getMyClients(coachId);

  // print('My Trainees');
  // trainees.forEach((client) {
  //   print(client.toJson());
  // });

  ClientModel c1 = await ClientApiHandler.getClient(AhmdId);
  print(' Client 1: ${c1.toJson()}');
  // ClientModel c2 = await ClientApiHandler.getClient(OmerId);
  // print(' Client 2: ${c2.toJson()}');
  // print('My Workouts');
  // List<WorkoutModel> cw = await WorkoutAPIHandler.getMyWorkouts(AhmdId);
  // cw.forEach((workout) {
  //   print(workout.toJson());
  // });

  // cw[0].done = true;
  // WorkoutModel mw = WorkoutModel.fromJson(cw[0].toJson());
  // WorkoutModel modwork = await WorkoutAPIHandler.updateWorkout(AhmdId, mw);

  // print('Updated Workout');
  // print(modwork.toJson());
}
// Run this file to see the output
// after you cd into the application directory run using the command: dart run r.dart