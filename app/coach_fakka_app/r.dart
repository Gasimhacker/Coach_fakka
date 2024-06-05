import 'package:coach_fakka_app/controllers/network_controllers/coach_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/exercise_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/coach_model.dart';
import 'package:coach_fakka_app/models/exercise_model.dart';
import 'package:coach_fakka_app/models/workout_model.dart';

void main() async {
  // CoachModel created =
  //     await CoachApiHandler.getCoach('3e2cafa9-6895-47c6-967c-b9048a97a5d8');
  // print(created.toJson());
  String coachId = '3e2cafa9-6895-47c6-967c-b9048a97a5d8';

  // ExerciseModel ex1 = ExerciseModel(
  //   description: 'BARBELL BENCH PRESS OR DUMBBELLS BENCH PRESS',
  //   link: 'https://www.youtube.com/shorts/i-gLOirnPaU',
  //   name: 'BARBELL BENCH',
  // );

  // ExerciseModel ex2 = ExerciseModel(
  //   description: 'MACHINE INCLINE CHEST PRESS',
  //   link: 'https://www.youtube.com/shorts/o0Ud3RU59hw',
  //   name: 'CHEST PRESS',
  // );

  // ExerciseModel ex3 = ExerciseModel(
  //   description: 'CABLE TRICEPPUSHDOWN',
  //   link: 'https://www.youtube.com/watch?v=2-LAMcpzODU',
  //   name: 'TRICEPPUSHDOWN',
  // );
  // await ExerciseAPIHandler.createNewExercise(ex1, coachId);
  // await ExerciseAPIHandler.createNewExercise(ex2, coachId);
  // await ExerciseAPIHandler.createNewExercise(ex3, coachId);

  List<ExerciseModel> exercises =
      await ExerciseAPIHandler.getAllExercises(coachId);
  exercises.forEach((element) {
    print(element.toJson());
  });
}
