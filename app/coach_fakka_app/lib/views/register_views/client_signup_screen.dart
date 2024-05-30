import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ClientSignup extends StatefulWidget {
  const ClientSignup({super.key});

  @override
  State<ClientSignup> createState() => _ClientSignupState();
}

class _ClientSignupState extends State<ClientSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              ClientSignupText(),
              SizedBox(
                height: 30.0,
              ),
              ClientNameField(),
              SizedBox(
                height: 30.0,
              ),
              ClientEmailField(),
              SizedBox(
                height: 30.0,
              ),
              ClientPasswordField(),
              SizedBox(
                height: 30.0,
              ),
              ClientAgeField(),
              SizedBox(
                height: 30.0,
              ),
              ClientGenderField(),
              SizedBox(
                height: 30.0,
              ),
              ClientWeightField(),
              SizedBox(
                height: 30.0,
              ),
              ClientHeightField(),
              SizedBox(
                height: 30.0,
              ),
              ClientGoalWeightField(),
              SizedBox(
                height: 30.0,
              ),
              ClientTrainingPlaceField(),
              SizedBox(
                height: 30.0,
              ),
              ClientTrainingDaysField(),
              SizedBox(
                height: 30.0,
              ),
              ClientTrainingHoursField(),
              SizedBox(
                height: 30.0,
              ),
              ClientActivityLevelField(),
              SizedBox(
                height: 30.0,
              ),
              ClientNeedSupplementField(),
              SizedBox(
                height: 30.0,
              ),
              ClientInjuryHistoryField(),
              SizedBox(
                height: 30.0,
              ),
              TraineeSignupButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientSignupText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class TraineeSignupButton extends StatelessWidget {
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
          'Sign Up',
          style: mainTextStyle,
        ),
      ),
    );
  }
}

class ClientNameField extends StatelessWidget {
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
          hintText: 'Enter your username',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class ClientEmailField extends StatelessWidget {
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
          hintText: 'Enter your email',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class ClientPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class ClientAgeField extends StatelessWidget {
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

class ClientGenderField extends StatefulWidget {
  @override
  State<ClientGenderField> createState() => _ClientGenderFieldState();
}

class _ClientGenderFieldState extends State<ClientGenderField> {
  String _selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select your gender:',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          value: _selectedGender,
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue!;
            });
          },
          items: <String>['Male', 'Female']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ClientWeightField extends StatelessWidget {
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

class ClientHeightField extends StatelessWidget {
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

class ClientGoalWeightField extends StatelessWidget {
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

class ClientTrainingPlaceField extends StatelessWidget {
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

class ClientTrainingDaysField extends StatelessWidget {
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

class ClientTrainingHoursField extends StatelessWidget {
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

class ClientActivityLevelField extends StatefulWidget {
  @override
  State<ClientActivityLevelField> createState() =>
      _ClientActivityLevelFieldState();
}

class _ClientActivityLevelFieldState extends State<ClientActivityLevelField> {
  double _activityLevel = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Activity Level',
          style: TextStyle(fontSize: 16),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 80.0,
          height: 50.0,
          child: Slider(
            value: _activityLevel,
            min: 1,
            max: 5,
            divisions: 4, // Number of divisions (5 - 1)
            onChanged: (newValue) {
              setState(() {
                _activityLevel = newValue;
              });
            },
          ),
        ),
        Text(
          'Level $_activityLevel',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class ClientNeedSupplementField extends StatelessWidget {
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

class ClientInjuryHistoryField extends StatelessWidget {
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
