import 'package:coach_fakka_app/controllers/network_controllers/coach_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/models/coach_model.dart';
import 'package:coach_fakka_app/models/workout_model.dart';

void main() async {
  String coachId = '3e2cafa9-6895-47c6-967c-b9048a97a5d8';
  String AhmdId = 'f5e23672-b827-49bd-a7ca-bd0d0d056872';

  CoachModel currentCoach = await CoachApiHandler.getCoach(coachId);
  print('Current Coach');
  print(currentCoach.toJson());

  List<ClientModel> trainees = await CoachApiHandler.getMyClients(coachId);

  print('My Trainees');
  trainees.forEach((client) {
    print(client.toJson());
  });

  print('My Workouts');
  List<WorkoutModel> cw = await WorkoutAPIHandler.getMyWorkouts(AhmdId);
  cw.forEach((workout) {
    print(workout.toJson());
  });
}
// Run this file to see the output
// after you cd into the application directory run using the command: dart run r.dart