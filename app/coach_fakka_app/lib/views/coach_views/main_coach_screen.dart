import 'package:coach_fakka_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CoachMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                // SizedBox(height: 40),
                CoachProfilePic(),
                SizedBox(height: 10),
                CoachNameWidget(),
                SizedBox(height: 20),
                SearchBarWidget(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: traineeList.length, // Replace with your data
              itemBuilder: (context, index) {
                return ClientListTile(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add functionality
        },
        child: Icon(Icons.add),
        backgroundColor: mainColor,
      ),
      drawer: CoachDrawer(),
    );
  }
}

class CoachDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: thirdColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CoachProfilePic(),
                CoachNameWidget(),
              ],
            ),
            decoration: BoxDecoration(
              color: mainColor,
            ),
          ),
          ListTile(
            title: Text(
              'Add Trainee',
              style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
            ),
            onTap: () {
              // Implement settings functionality
            },
          ),
          ListTile(
            title: Text(
              'Add Exercise',
              style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
            ),
            onTap: () {
              // Implement settings functionality
            },
          ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
            ),
            onTap: () {
              // Implement profile functionality
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
            ),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ClientListTile extends StatelessWidget {
  int index;
  ClientListTile({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: mainColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            traineeList[index].imagePath,
          ), // Replace with trainee images
        ),
        title: Text(
          traineeList[index].name,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Coiny',
          ),
        ), // Replace with trainee names
        trailing: TextButton(
          onPressed: () {
            // Implement edit functionality
          },
          child: Text('Train',
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'Coiny')),
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

class CoachNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Fakkah',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'BungeeSpice'),
    );
  }
}

class CoachProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(
          'assets/images/moe_salah.jpg'), // Replace with your profile image
    );
  }
}

class Trainee {
  final String name;
  final String imagePath;

  Trainee({required this.name, required this.imagePath});
}

// Example data (replace with your actual data)
final List<Trainee> traineeList = [
  Trainee(name: 'Trainee 1', imagePath: 'assets/images/moe_salah.jpg'),
  Trainee(name: 'Trainee 2', imagePath: 'assets/images/moe_salah.jpg'),
  // Add more trainees here
];