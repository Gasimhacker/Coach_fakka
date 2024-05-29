import 'package:coach_fakka_app/utils/utils.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget UserMainAppBar() {
  return AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        icon: CircleAvatar(
          child: Icon(Icons.menu, color: Colors.white),
          backgroundColor: mainColor,
        ),
        color: Colors.white,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    }),
    title: Text(''),
  );
}

class UserNameWidget extends StatelessWidget {
  final String userName;
  UserNameWidget({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Text(
      userName,
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'BungeeSpice'),
    );
  }
}

class UserProfilePic extends StatelessWidget {
  final String imagePath;
  UserProfilePic({required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(imagePath), // Replace with your profile image
    );
  }
}
