import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AddWourkoutExercise extends StatefulWidget {
  const AddWourkoutExercise({super.key});

  @override
  State<AddWourkoutExercise> createState() => _AddWourkoutExerciseState();
}

class _AddWourkoutExerciseState extends State<AddWourkoutExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExerciseFormField('Sets'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ExerciseFormField('Reps'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExerciseFormField('Weight'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ExerciseFormField('Rest time'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExerciseFormField('RPE'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ExerciseFormField('Warm up'),
              ],
            ),
            SubmitExerciseButton(),
          ],
        ),
      ),
    );
  }
}

class SubmitExerciseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Null;
        },
        child: Text(
          'Submit',
          style: secondryTextStyle,
        ),
      ),
    );
  }
}

class ExerciseFormField extends StatelessWidget {
  String title;
  ExerciseFormField(this.title);

  @override
  Widget build(BuildContext context) {
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
            child: TextField(
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
}
