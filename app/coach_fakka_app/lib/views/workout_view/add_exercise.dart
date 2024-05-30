import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AddExercies extends StatefulWidget {
  const AddExercies({super.key});

  @override
  State<AddExercies> createState() => _AddExerciesState();
}

class _AddExerciesState extends State<AddExercies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          FormTextTitle('Exercise Name'),
          SizedBox(height: 10),
          CustomFormFiled('Enter Exercise Name'),
          SizedBox(height: 10),
          FormTextTitle('Exercise Description'),
          SizedBox(height: 10),
          CustomFormFiled('Enter Exercise Description'),
          SizedBox(height: 10),
          FormTextTitle('Exercise Link (optional)'),
          SizedBox(height: 10),
          CustomFormFiled('Enter Exercise Link'),
          SizedBox(height: 10),
          SubmitExerciseButton(),
        ],
      ),
    );
  }
}

class CustomFormFiled extends StatelessWidget {
  String hintText;
  CustomFormFiled(this.hintText);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelStyle: TextStyle(color: Colors.grey),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class FormTextTitle extends StatelessWidget {
  String title;
  FormTextTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
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
    );
  }
}

class SubmitExerciseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
      width: MediaQuery.of(context).size.width - 160.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          // POST EXERCISE API /api/v1/<coach_id>/exercises WITH body {name, description, link}
        },
        child: Text(
          'Submit',
          style: secondryTextStyle,
        ),
      ),
    );
  }
}
