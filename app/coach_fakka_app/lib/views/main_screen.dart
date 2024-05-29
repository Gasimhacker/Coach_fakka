import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/register_views/register_screens.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            AppAvatarWidget(),
            //Coach Fakka Text Widget
            AppTitleWidget(),
            //Are you? Text Widget
            MainScreenTextsWidget('Are you?'),
            //Coach Button
            CoachButton(),
            //Or Text Widget
            MainScreenTextsWidget('Or'),
            //Trainee Button
            ClientButton(),
          ],
        ),
      ),
    );
  }
}

class ClientButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ClientLogin();
          }));
        },
        child: Text(
          'Trainee',
          style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
        ),
      ),
    );
  }
}

class CoachButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CoachLogin();
          }));
        },
        child: Text(
          'Coach',
          style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainScreenTextsWidget extends StatelessWidget {
  String _text;
  MainScreenTextsWidget(this._text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        _text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Jaro'),
      ),
    );
  }
}

class AppTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'Coach Fakka ',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'BungeeSpice'),
      ),
    );
  }
}

class AppAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(
        'assets/images/moe_salah.jpg',
      ),
    );
  }
}
