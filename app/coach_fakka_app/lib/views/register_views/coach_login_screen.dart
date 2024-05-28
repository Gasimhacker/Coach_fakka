import 'package:coach_fakka_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CoachLogin extends StatefulWidget {
  @override
  State<CoachLogin> createState() => _CoachLoginState();
}

class _CoachLoginState extends State<CoachLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CoachLoginText(),
              SizedBox(
                height: 30.0,
              ),
              CoachEmailField(),
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
            null;
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

class CoachLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          Null;
        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
        ),
      ),
    );
  }
}

class CoachPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 50.0,
      child: TextFormField(
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
}

class CoachEmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 50.0,
      child: TextFormField(
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
