import 'package:coach_fakka_app/views/coach_views/widgets.dart';
import 'package:coach_fakka_app/views/workout_view/add_workout_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class IndividualClientView extends StatefulWidget {
  final String? clientID;
  final String? coachID;
  IndividualClientView({required this.clientID, required this.coachID});

  @override
  State<IndividualClientView> createState() => _IndividualClientViewState();
}

class _IndividualClientViewState extends State<IndividualClientView> {
  @override
  void initState() {
    // TODO: GET REQUEST FROM API TO GET CLIENT DATA /api/v1/<client_id>/workouts/
    super.initState();
  }

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

  ClientCoachDrawer() {
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
                  userName: 'Client Name',
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: mainColor,
            ),
          ),
          ListTile(
            title: Text(
              'Add Workout',
              style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddWorkout();
              }));
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
        ],
      ),
    );
  }

  TaskListTile({required int index}) {
    int index = 0;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: mainColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),

        leading: Text(taskList[index].name, style: mainTextStyle),
        title: Center(
          child:
              Text('Date: ${taskList[index].createdAt}', style: mainTextStyle),
        ), // Replace with trainee names
        trailing: TextButton(
          onPressed: () {
            // Implement edit functionality
          },
          child: taskList[index].isCompleted
              ? Text('Completed', style: mainTextStyle)
              : Text('Not Completed', style: mainTextStyle),
        ),
      ),
    );
  }
}

class Task {
  final String name;
  final String createdAt;
  final bool isCompleted;

  Task({required this.name, required this.createdAt, this.isCompleted = false});
}

// Example data (replace with your actual data)
final List<Task> taskList = [
  Task(name: 'Upper 1', createdAt: '2024-05-29', isCompleted: true),
  Task(name: 'Lower 1', createdAt: '2024-05-29', isCompleted: false),
  // Add more trainees here
];

// ignore: must_be_immutable

