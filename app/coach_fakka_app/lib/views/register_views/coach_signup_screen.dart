import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CoachSignup extends StatefulWidget {
  const CoachSignup({super.key});

  @override
  State<CoachSignup> createState() => _CoachSignupState();
}

class _CoachSignupState extends State<CoachSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            CoachSignupText(),
            SizedBox(
              height: 30.0,
            ),
            FormTextTitle('FULL NAME'),
            CoachNameField(),
            SizedBox(
              height: 20.0,
            ),
            FormTextTitle('EMAIL'),
            CoachEmailField(),
            SizedBox(
              height: 20.0,
            ),
            FormTextTitle('PASSWORD'),
            CoachPasswordField(),
            SizedBox(
              height: 20.0,
            ),
            FormTextTitle('PHONE'),
            CoachPhoneField(),
            SizedBox(
              height: 20.0,
            ),
            FormTextTitle('ADDRESS'),
            CoachAddressField(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      )),
    );
  }

  CoachNameField() {
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
      height: 50.0,
      child: TextFormField(
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
      height: 50.0,
      child: TextFormField(
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

  CoachPhoneField() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 50.0,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your Phone Number',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  CoachAddressField() {
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
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your Address',
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

  Widget ClientSignupText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'BungeeSpice',
      ),
    );
  }
}
