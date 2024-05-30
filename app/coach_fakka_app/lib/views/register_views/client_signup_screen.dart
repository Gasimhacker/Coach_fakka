import 'package:coach_fakka_app/controllers/auth_contollers/client_auth_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/utils/show_snackBar.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientSignup extends StatefulWidget {
  @override
  State<ClientSignup> createState() => _ClientSignupState();
}

class _ClientSignupState extends State<ClientSignup> {
  final ClientAuthHandler _authHandler = ClientAuthHandler();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late ClientModel newClient = ClientModel();
  late String password;

  _signUpClient() async {
    if (_formKey.currentState!.validate()) {
      await _authHandler.signUpClient(newClient, password).whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();
        });
      });
      return showSnack(
          context, 'Congratulations, Account Created Successfully');
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
              ClientSignupText(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('NAME'),
              ClientNameField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('EMAIL'),
              ClientEmailField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('PASSWORD'),
              ClientPasswordField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('COACH ID'),
              ClientCoachIdField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('AGE'),
              ClientAgeField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('GENDER'),
              ClientGenderField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('CURRENT WEIGHT'),
              ClientWeightField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('HEIGHT'),
              ClientHeightField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('GOAL WEIGHT'),
              ClientGoalWeightField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('TRAINING PLACE'),
              ClientTrainingPlaceField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('TRAINING DAYS'),
              ClientTrainingDaysField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('TRAINING HOURS'),
              ClientTrainingHoursField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('ACTIVITY LEVEL'),
              ClientActivityLevelField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('NEED SUPPLEMENT'),
              ClientNeedSupplementField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('INJURY HISTORY'),
              ClientInjuryHistoryField(),
              SizedBox(
                height: 10.0,
              ),
              ClientSignupButton(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClientSignupButton() {
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
          _signUpClient();
        },
        child: Text(
          'Sign Up',
          style: mainTextStyle,
        ),
      ),
    );
  }

  ClientNameField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
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
        onSaved: (value) {
          newClient.name = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      ),
    );
  }

  ClientEmailField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
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
        onSaved: (value) {
          newClient.email = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }

  ClientPasswordField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
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
        onSaved: (value) {
          password = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  Widget ClientAgeField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your age',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onSaved: (value) {
          newClient.age = int.parse(value!);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your age';
          }
          return null;
        },
      ),
    );
  }

  Widget ClientGenderField() {
    String _selectedGender = 'Male';
    return Center(
      child: Column(
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
                newClient.Gender = newValue;
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
      ),
    );
  }

  Widget ClientWeightField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onSaved: (value) {
          newClient.weight = double.parse(value!);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your weight';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Whats your weight? (in kg)',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientHeightField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onSaved: (value) {
          newClient.height = int.parse(value!);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your height';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'What is your height? (in cm)',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientGoalWeightField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (value) {
          newClient.goalWeight = double.parse(value!);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your goal weight';
          }
          return null;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'What is your goal weight?',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientTrainingPlaceField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (value) {
          newClient.traiiingPlace = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your training place';
          }
          return null;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Where do you train?',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientTrainingDaysField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onSaved: (value) {
          newClient.traiangDays = int.parse(value!);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your training days';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'How many days do you train per week?',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientTrainingHoursField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onSaved: (value) {
          newClient.traiangHours = double.parse(value!);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your training hours';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'How many hours can you train per day?',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientActivityLevelField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            'Activity Level',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 80.0,
            height: 70.0,
            child: Slider(
              value: 1,
              min: 1,
              max: 5,
              divisions: 4, // Number of divisions (5 - 1)
              onChanged: (newValue) {
                setState(() {
                  newClient.activityLevel = newValue.toInt();
                });
              },
            ),
          ),
          Text(
            'Level 1',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget ClientNeedSupplementField() {
    String _selectedSupplement = 'NO';
    return Center(
      child: Column(
        children: [
          Text(
            'Do you need supplement?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: _selectedSupplement,
            onChanged: (newValue) {
              setState(() {
                _selectedSupplement = newValue!;
                newClient.needSupplement = bool.parse(newValue);
              });
            },
            items: <String>['YES', 'NO']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget ClientInjuryHistoryField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onSaved: (value) {
          newClient.injuryHistory = value;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Do you have any injury history?',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget ClientCoachIdField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      width: MediaQuery.of(context).size.width - 80.0,
      height: 70.0,
      child: TextFormField(
        onSaved: (value) {
          newClient.injuryHistory = value;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: 'Enter your coach ID',
          hintStyle: TextStyle(color: Colors.grey),
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

class FormTextTitle extends StatelessWidget {
  final String title;
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
