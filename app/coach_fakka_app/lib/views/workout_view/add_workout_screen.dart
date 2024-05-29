import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  bool _showexercises = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: thirdColor,
              ),
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
                          onPressed: () {
                            setState(() {
                              _showexercises = true;
                            });
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
            Visibility(
              visible: _showexercises,
              child: Expanded(
                child: ListView.builder(
                  itemCount: 10, // Replace with your data
                  itemBuilder: (context, index) {
                    return NewExerciseListTile(
                      index: index,
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
                        setState(() {
                          _showexercises = false;
                        });
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
                      onPressed: () {
                        setState(() {
                          _showexercises = false;
                        });
                      },
                      child: Text(
                        'Save workout',
                        style: mainTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewExerciseListTile extends StatelessWidget {
  int index;
  NewExerciseListTile({required this.index});
  @override
  Widget build(BuildContext context) {
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
          '${index} - Exercie name',
          style: secondryTextStyle,
        ),
        trailing: Text(
          'Sets: 3, Reps: 10',
          style: secondryTextStyle,
        ),
      ),
    );
  }
}
