import 'package:coach_fakka_app/utils/colors.dart';
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
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/moe_salah.jpg',
              ),
            ),
            //Coach Fakka Text Widget
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Coach Fakka ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BungeeSpice')),
            ),
            //Are you? Text Widget
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Are you?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jaro'),
              ),
            ),
            //Coach Button
            Container(
              width: MediaQuery.of(context).size.width - 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  Null;
                },
                child: Text(
                  'Coach',
                  style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
                ),
              ),
            ),
            //Or Text Widget
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Or',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jaro'),
              ),
            ),
            //Trainee Button
            Container(
              width: MediaQuery.of(context).size.width - 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  Null;
                },
                child: Text(
                  'Trainee',
                  style: TextStyle(color: Colors.white, fontFamily: 'Coiny'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
