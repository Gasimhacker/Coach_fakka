import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/workout_model.dart';

void main() async {
  WorkoutModel ub1 = WorkoutModel(
    name: 'Upper Body 1',
    note: 'Upper Body Workout 1',
    client_id: 'a0e4539a-ed32-47e3-9e2e-7e4eb6ec3401',
  );

  WorkoutModel createdWorkout = await WorkoutAPIHandler.creatWorkout(
      'a0e4539a-ed32-47e3-9e2e-7e4eb6ec3401', ub1);

  print(createdWorkout.toJson());

  List<WorkoutModel> workouts = await WorkoutAPIHandler.getMyWorkouts(
      'a0e4539a-ed32-47e3-9e2e-7e4eb6ec3401');

  workouts.forEach((workout) {
    print(workout.toJson());
  });
}
