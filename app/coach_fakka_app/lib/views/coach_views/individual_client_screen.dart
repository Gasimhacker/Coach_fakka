import 'package:coach_fakka_app/views/coach_views/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class IndividualClientView extends StatelessWidget {
  const IndividualClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: UserMainAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
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
                UserProfilePic(
                  imagePath: dummyImagePath,
                ),
                SizedBox(height: 10),
                UserNameWidget(
                  userName: 'Client Name',
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length, // Replace with your data
              itemBuilder: (context, index) {
                return TaskListTile(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
      drawer: ClientCoachDrawer(),
    );
  }
}

class ClientCoachDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: thirdColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                UserProfilePic(
                  imagePath: dummyImagePath,
                ),
                UserNameWidget(
                  userName: 'Coach Fakka',
                ),
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

class Task {
  final String name;
  final String imagePath;

  Task({required this.name, required this.imagePath});
}

// Example data (replace with your actual data)
final List<Task> taskList = [
  Task(name: 'Task 1', imagePath: dummyImagePath),
  Task(name: 'Task 2', imagePath: dummyImagePath),
  // Add more trainees here
];

// ignore: must_be_immutable
class TaskListTile extends StatelessWidget {
  int index;
  TaskListTile({required this.index});

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
            taskList[index].imagePath,
          ), // Replace with trainee images
        ),
        title: Text(
          taskList[index].name,
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
