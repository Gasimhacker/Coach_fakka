import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ClientLogin extends StatefulWidget {
  const ClientLogin({super.key});

  @override
  State<ClientLogin> createState() => _ClientLoginState();
}

class _ClientLoginState extends State<ClientLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
    );
  }
}

class TraineeToSignupButton extends StatelessWidget {
  const TraineeToSignupButton({
    super.key,
  });

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
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Coiny'),
          ),
        ),
      ],
    );
  }
}

class TraineeLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class TraineePasswordField extends StatelessWidget {
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
}

class TraineeEmailField extends StatelessWidget {
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
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your email or username',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class TraineeLoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
