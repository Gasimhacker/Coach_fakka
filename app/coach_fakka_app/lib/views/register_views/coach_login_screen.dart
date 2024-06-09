import 'package:coach_fakka_app/controllers/auth_controllers/coach_auth_handler.dart';
import 'package:coach_fakka_app/utils/show_snackBar.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/coach_views/main_coach_screen.dart';
import 'package:coach_fakka_app/views/register_views/coach_signup_screen.dart';
import 'package:flutter/material.dart';

class CoachLogin extends StatefulWidget {
  @override
  State<CoachLogin> createState() => _CoachLoginState();
}

class _CoachLoginState extends State<CoachLogin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CoachAuthHandler _authController = CoachAuthHandler();
  late String email;
  late String password;

  _LoginCoach() async {
    if (_formKey.currentState!.validate()) {
      String _response = await _authController.signInCoach(email, password);
      print(_response);
      if (_response != 'ERROR 1' &&
          _response != 'ERROR 2' &&
          _response != 'ERROR 3') {
        Future.delayed(Duration(seconds: 2), () {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CoachMainScreen(
                  coachId: _response,
                );
              },
            ),
          );
        });
      }
      if (_response == 'ERROR 1') {
        showSnack(context, 'Please fill all fields');
      } else if (_response == 'ERROR 2') {
        showSnack(context, 'No such coach found');
      } else if (_response == 'ERROR 3') {
        showSnack(context, 'Password or email is incorrect');
      }
    } else {
      showSnack(context, 'Please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoachLoginText(),
                SizedBox(
                  height: 30.0,
                ),
                CoachEmailField(context),
                SizedBox(
                  height: 30.0,
                ),
                CoachPasswordField(),
                SizedBox(
                  height: 30.0,
                ),
                CoachLoginButton(),
                CoachToSignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CoachLoginButton() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          _LoginCoach();
        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
        ),
      ),
    );
  }

  Widget CoachPasswordField() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        validator: (value) =>
            value!.isEmpty ? 'Please enter your password' : null,
        decoration: InputDecoration(
          labelStyle:
              TextStyle(color: Colors.white), // Customize label text color
          border: OutlineInputBorder(), // Add a border around the text field
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: mainColor,
            ), // Customize focused border color
          ),
          hintText: 'Enter Password', // Placeholder text
          hintStyle: TextStyle(
            color: Colors.grey,
          ), // Customize hint text color // Add an icon before the input field
        ),
      ),
    );
  }

  Widget CoachEmailField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onChanged: (value) {
          email = value;
        },
        validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          hintText: 'Enter your email or username',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class CoachToSignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You don\'t have an account?',
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CoachSignup();
            }));
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Coiny'),
          ),
        ),
      ],
    );
  }
}

class CoachLoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Coachs Login',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'BungeeSpice',
      ),
    );
  }
}
