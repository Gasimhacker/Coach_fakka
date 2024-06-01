import 'package:coach_fakka_app/controllers/auth_contollers/client_auth_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/utils/show_snackBar.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/client_views/main_client_screen.dart';
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
    print('Ax0');
    if (_formKey.currentState!.validate()) {
      await _authHandler.signUpClient(newClient, password).whenComplete(() {
        //Check the return status
        print('Ax1');
        setState(() {
          print('Cx0');
          _formKey.currentState!.reset();
          print('Cx1');
          showSnack(context, 'Congratulations, Account Created Successfully');
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ClientMainScreen(
                clientId: 'Obada',
              );
            },
          ),
        );
      });
      print('Cx2');
      showSnack(context, 'Congratulations, Account Created Successfully');
    } else {
      print('Ax2');
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
              FormTextTitle('INJURY HISTORY'),
              ClientInjuryHistoryField(),
              SizedBox(
                height: 10.0,
              ),
              FormTextTitle('GENDER'),
              ClientGenderField(),
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
        onChanged: (value) {
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
        onChanged: (value) {
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
        onChanged: (value) {
          password = value;
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
        onChanged: (value) {
          newClient.age = int.parse(value);
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

  String selectedGender = 'MALE';
  Widget ClientGenderField() {
    return Center(
      child: Column(
        children: [
          RadioListTile<String>(
            title: const Text('MALE'),
            value: 'MALE',
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
                newClient.gender = 'MALE';
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('FEMALE'),
            value: 'FEMALE',
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
                newClient.gender = 'FEMALE';
              });
            },
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
        onChanged: (value) {
          newClient.weight = double.parse(value);
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
        onChanged: (value) {
          newClient.height = int.parse(value);
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
        onChanged: (value) {
          newClient.goalWeight = double.parse(value);
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
        onChanged: (value) {
          newClient.trainningPlace = value;
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
        onChanged: (value) {
          newClient.traiangDays = int.parse(value);
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
        onChanged: (value) {
          newClient.traiangHours = double.parse(value);
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

  String selectedActivityLevel = '1';
  ClientActivityLevelField() {
    return Column(
      children: [
        RadioListTile<String>(
          title: const Text('1 LOW'),
          value: '1',
          groupValue: selectedActivityLevel,
          onChanged: (value) {
            setState(() {
              selectedActivityLevel = value!;
              newClient.activityLevel = 1;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('2 MEDUIM'),
          value: '2',
          groupValue: selectedActivityLevel,
          onChanged: (value) {
            setState(() {
              selectedActivityLevel = value!;
              newClient.activityLevel = 2;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('3 HIGH'),
          value: '3',
          groupValue: selectedActivityLevel,
          onChanged: (value) {
            setState(() {
              selectedActivityLevel = value!;
              newClient.activityLevel = 3;
            });
          },
        ),
      ],
    );
  }

  String selectedSupplement = 'NO';
  Widget ClientNeedSupplementField() {
    return Center(
      child: Column(
        children: [
          RadioListTile<String>(
            title: const Text('NO'),
            value: 'NO',
            groupValue: selectedSupplement,
            onChanged: (value) {
              setState(() {
                selectedSupplement = value!;
                newClient.needSupplement = false;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('YES'),
            value: 'YES',
            groupValue: selectedSupplement,
            onChanged: (value) {
              setState(() {
                selectedSupplement = value!;
                newClient.needSupplement = true;
              });
            },
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
        onChanged: (value) {
          newClient.injuryHistory = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your injury history';
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
        onChanged: (value) {
          newClient.coachId = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your coach ID';
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
