import 'package:coach_fakka_app/controllers/controllers.dart';
import 'package:coach_fakka_app/models/models.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/coach_views/main_coach_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/show_snackBar.dart';

class CoachSignup extends StatefulWidget {
  const CoachSignup({super.key});

  @override
  State<CoachSignup> createState() => _CoachSignupState();
}

class _CoachSignupState extends State<CoachSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CoachAuthHandler _authHandler = CoachAuthHandler();
  late CoachModel newCoach = CoachModel();
  late String password;

  _signUpCoach() async {
    if (_formKey.currentState!.validate()) {
      String newId = await _authHandler.signUpCoach(newCoach, password);
      if (newId == 'Something went wrong' ||
          newId == 'null' ||
          newId.length < 36) {
        showSnack(context, 'Something went wrong');
        return;
      }
      setState(() {
        _formKey.currentState!.reset();
      });
      showSnack(context, 'Congratulations, Account Created Successfully');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CoachMainScreen(
              coachId: newId,
            );
          },
        ),
      );
    } else {
      showSnack(context, 'Please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              CoachSignupText(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('FULL NAME'),
              CoachNameField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('EMAIL'),
              CoachEmailField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('PASSWORD'),
              CoachPasswordField(),
              SizedBox(
                height: 10.0,
              ),
              CoachSignupButton(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CoachNameField() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      height: 70.0,
      child: TextFormField(
        onChanged: (value) {
          newCoach.name = value;
        },
        validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your Full Name',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  CoachEmailField() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      height: 70.0,
      child: TextFormField(
        onChanged: (value) {
          newCoach.email = value;
        },
        validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your Email',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  CoachPasswordField() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      height: 70.0,
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        validator: (value) =>
            value!.isEmpty ? 'Please enter your password' : null,
        obscureText: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your Password',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  CoachSignupText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'BungeeSpice',
      ),
    );
  }

  FormTextTitle(String title) {
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

  CoachSignupButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          _signUpCoach();
        },
        child: Text(
          'Sign Up',
          style: mainTextStyle,
        ),
      ),
    );
  }
}
