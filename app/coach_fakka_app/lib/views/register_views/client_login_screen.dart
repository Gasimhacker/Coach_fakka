import 'package:coach_fakka_app/controllers/auth_contollers/client_auth_handler.dart';
import 'package:coach_fakka_app/utils/show_snackBar.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/client_views/main_client_screen.dart';
import 'package:flutter/material.dart';

class ClientLogin extends StatefulWidget {
  const ClientLogin({super.key});

  @override
  State<ClientLogin> createState() => _ClientLoginState();
}

class _ClientLoginState extends State<ClientLogin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ClientAuthHandler _authController = ClientAuthHandler();
  late String email;
  late String password;

  _LoginClient() async {
    if (_formKey.currentState!.validate()) {
      await _authController.signInClient(email, password);

      if (_authController.signInClientStatus) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ClientMainScreen();
            },
          ),
        );
      }
      showSnack(context, 'Sing in failed');
    } else {
      showSnack(context, 'Please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TraineeLoginText(),
                SizedBox(
                  height: 30.0,
                ),
                TraineeEmailField(),
                SizedBox(
                  height: 30.0,
                ),
                TraineePasswordField(),
                SizedBox(
                  height: 30.0,
                ),
                TraineeLoginButton(),
                TraineeToSignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TraineeToSignupButton() {
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
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Coiny'),
          ),
        ),
      ],
    );
  }

  TraineeLoginButton() {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
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
          'Login',
          style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
        ),
      ),
    );
  }

  TraineePasswordField() {
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
              color: secondaryColor,
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

  TraineeEmailField() {
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
          hintText: 'Enter your email or username',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  TraineeLoginText() {
    return Text(
      'Trainee Login',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'BungeeSpice',
      ),
    );
  }
}
