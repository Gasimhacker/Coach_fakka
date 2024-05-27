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
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              child: Image(
                image: AssetImage(
                  'assets/images/moe_salah.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            Text('Coach Fakka '),
          ],
        ),
      ),
    );
  }
}
