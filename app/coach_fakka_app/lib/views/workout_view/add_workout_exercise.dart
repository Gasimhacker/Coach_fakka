import 'package:coach_fakka_app/controllers/network_controllers/workout_exercise_api_handler.dart';
import 'package:coach_fakka_app/models/workout_exercise_model.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/workout_view/add_workout_screen.dart';
import 'package:flutter/material.dart';

class AddWourkoutExercise extends StatefulWidget {
  late final String workoutId;
  late final String clientId;
  AddWourkoutExercise({required this.workoutId, required this.clientId});

  @override
  State<AddWourkoutExercise> createState() => _AddWourkoutExerciseState();
}

class _AddWourkoutExerciseState extends State<AddWourkoutExercise> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late WorkoutExerciseModel newExercise =
      WorkoutExerciseModel(workout_id: widget.workoutId);
  late String exName;
  _AddWourkoutExercise() async {
    if (_formKey.currentState!.validate()) {
      String exeId = '2427bc7a-00eb-42e7-8384-d466efeb0cb2';
      await WorkoutExerciseApiHandler.createWorkoutExercise(
          widget.workoutId, newExercise, exeId);
      AddWorkout.workoutExerciseName.add(exName);
    }
    String exeId = '2427bc7a-00eb-42e7-8384-d466efeb0cb2';
    await WorkoutExerciseApiHandler.createWorkoutExercise(
        widget.workoutId, newExercise, exeId);
    AddWorkout.workoutExerciseName.add(exName);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    exNameField(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ExerciseSetsFormField(
                          'Sets',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ExerciseRepsFormField(
                          'Reps',
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ExerciseWeightFormField(
                          'Weight',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ExerciseRTFormField(
                          'Rest time',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ExerciseRPEFormField(
                          'RPE',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ExerciseWUFormField(
                          'Warm up',
                        ),
                      ],
                    ),
                    SubmitExerciseButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ExerciseSetsFormField(String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => newExercise.sets = int.parse(value),
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ExerciseRepsFormField(String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => newExercise.reps = int.parse(value),
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ExerciseWeightFormField(String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => newExercise.weight = int.parse(value),
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ExerciseRTFormField(String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => newExercise.restTime = int.parse(value),
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ExerciseRPEFormField(String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => newExercise.rpe = int.parse(value),
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ExerciseWUFormField(String title) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => newExercise.warm_up = bool.parse(value),
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ExerciseFormField(String title, {dynamic valueToBeChanged}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: mainTextStyle,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 80,
            child: TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter $title' : null,
              onChanged: (value) => valueToBeChanged = value,
              textAlign: TextAlign.center,
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              style: secondryTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SubmitExerciseButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
      ),
      width: MediaQuery.of(context).size.width - 160.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          null;
          // GET Request to get all exercises //api/v1/<coach_id>/exercises to choose from and get the id
          // POST request to add exercise /api/v1/<workout_id>/workout_exercises/<exercise_id> with body
        },
        child: Text(
          'Submit',
          style: secondryTextStyle,
        ),
      ),
    );
  }

  Widget exNameField() {
    return Column(
      children: [
        Container(
          child: Text(
            'Workout Name',
            style: mainTextStyle,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: mainColor,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 50,
            child: TextFormField(
              onChanged: (value) => exName = value,
              validator: (value) =>
                  value!.isEmpty ? 'Enter workout name' : null,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelStyle: TextStyle(color: Colors.grey),
                hintText: 'workout name',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
