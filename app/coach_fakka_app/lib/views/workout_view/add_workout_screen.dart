import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/workout_exercise_api_handler.dart';
import 'package:coach_fakka_app/models/workout_exercise_model.dart';
import 'package:coach_fakka_app/models/workout_model.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/workout_view/add_workout_exercise.dart';
import 'package:flutter/material.dart';

class AddWorkout extends StatefulWidget {
  final String clientId;
  final String coachId;
  static List<String> workoutExerciseName = [];
  AddWorkout({required this.clientId, required this.coachId});
  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  late String workoutName;
  late String workoutNote;
  late String newWorkoutId;
  static List<WorkoutExerciseModel> exercises = [];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<String> _createWorkout() async {
    String response = 'Empty response';
    if (_formKey.currentState!.validate()) {
      WorkoutModel newWorkout = WorkoutModel(
        name: workoutName,
        note: workoutNote,
      );
      WorkoutModel createdWorkout =
          await WorkoutAPIHandler.creatWorkout(widget.clientId, newWorkout);
      response = createdWorkout.id!;
      _showexercises = true;
      // get workout id from response
      // send workout id to add exercise screen
    }
    print(response);
    return response;
  }

  _initcalls() async {
    exercises =
        await WorkoutExerciseApiHandler.getWorkoutExercises(newWorkoutId);
    setState(() {});
  }

  bool _showexercises = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: thirdColor,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
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
                        onChanged: (value) => workoutName = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter workout name' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'workout name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      'Workout Notes',
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
                        onChanged: (value) => workoutNote = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter workout notes' : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelStyle: TextStyle(color: Colors.grey),
                          hintText: 'workout notes',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: !_showexercises,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            newWorkoutId = await _createWorkout();
                            setState(() {});
                          },
                          child: Text(
                            'Add Exercises',
                            style: mainTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _showexercises,
            child: Expanded(
              child: ListView.builder(
                itemCount: exercises.length, // Replace with your data
                itemBuilder: (context, index) {
                  return _NewExerciseListTile(
                    index,
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: _showexercises,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 250,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddWourkoutExercise(
                          workoutId: newWorkoutId,
                          clientId: widget.clientId,
                        );
                      }));
                    },
                    child: Text(
                      'Add exercise',
                      style: mainTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 250,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Save workout',
                      style: mainTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _NewExerciseListTile(int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: secondaryColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),
        leading: Text(
          '${index} -${AddWorkout.workoutExerciseName[index]}',
          style: secondryTextStyle,
        ),
        trailing: Text(
          'Sets: ${exercises[index].sets}, Reps: ${exercises[index].reps}',
          style: secondryTextStyle,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable




  // Widget exercisesList() {
  //   String _selectedItem = 'Select an option';
  //   return DropdownButton<String>(
  //     value: _selectedItem,
  //     onChanged: (newValue) {
  //       setState(() {
  //         _selectedItem = newValue!;
  //       });
  //     },
  //     items: items.map((item) {
  //       return DropdownMenuItem<String>(
  //         value: item,
  //         child: Text(item),
  //       );
  //     }).toList(),
  //     hint: Text('Select an option'), // Optional hint text
  //   );
  // }