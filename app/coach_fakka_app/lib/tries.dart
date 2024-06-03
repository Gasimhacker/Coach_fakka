import 'package:coach_fakka_app/controllers/controllers.dart';
import 'package:coach_fakka_app/models/models.dart';

void main() async {
  WorkoutModel ub1 = WorkoutModel(
    name: 'Upper Body 1',
    note: 'Upper Body Workout 1',
    client_id: '1c660b17-ad1d-4159-a97e-d17a6d24775b',
  );

  WorkoutModel createdWorkout = await WorkoutAPIHandler.creatWorkout(
      '1c660b17-ad1d-4159-a97e-d17a6d24775b', ub1);

  print(createdWorkout.toJson());

  List<WorkoutModel> workouts = await WorkoutAPIHandler.getMyWorkouts(
      '1c660b17-ad1d-4159-a97e-d17a6d24775b');

  workouts.forEach((workout) {
    print(workout.toJson());
  });
}
