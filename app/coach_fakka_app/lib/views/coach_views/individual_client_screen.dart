import 'package:coach_fakka_app/controllers/network_controllers/client_api_handler.dart';
import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/models/workout_model.dart';
import 'package:coach_fakka_app/views/coach_views/widgets.dart';
import 'package:coach_fakka_app/views/workout_view/add_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/utils.dart';

class IndividualClientView extends StatefulWidget {
  final String? clientID;
  final String? coachID;
  IndividualClientView({required this.clientID, required this.coachID});

  @override
  State<IndividualClientView> createState() => _IndividualClientViewState();
}

class _IndividualClientViewState extends State<IndividualClientView> {
  late ClientModel currentClient = ClientModel(name: ' ', email: ' ', id: ' ');
  late List<WorkoutModel> workouts = [];
  _initCalls() async {
    currentClient = await ClientApiHandler.getClient(widget.clientID!);
    workouts = await WorkoutAPIHandler.getMyWorkouts(widget.clientID!);
    setState(() {});
  }

  @override
  void initState() {
    _initCalls();
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
                  userName: currentClient.name!,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workouts.length, // Replace with your data
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
    final ValueNotifier<bool> _showFeatureLater = ValueNotifier(false);
    return Drawer(
      backgroundColor: thirdColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    UserProfilePic(
                      imagePath: dummyImagePath,
                    ),
                    UserNameWidget(
                      userName: currentClient.name!,
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
                    return AddWorkout(
                      clientId: widget.clientID!,
                      coachId: widget.coachID!,
                    );
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
                ),
                onTap: () {
                  _showFeatureLater.value = !_showFeatureLater.value;
                },
              ),
            ],
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _showFeatureLater,
            builder: (context, show, child) {
              return Visibility(
                visible: show,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: mainColor,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          'This feature will be available later.',
                          style: mainTextStyle,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showFeatureLater.value = !_showFeatureLater.value;
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _formatDate(String date) {
    final parsedDateTime = DateTime.parse(date);
    final formattedDate = DateFormat('MMM d').format(parsedDateTime);
    return formattedDate;
  }

  TaskListTile({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: mainColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),

        leading: Text(workouts[index].name!, style: mainTextStyle),
        // title: Center(
        //   child: Text('Date: ${_formatDate(workouts[index].created_at!)}',
        //       style: mainTextStyle),
        // ), // Replace with trainee names
        trailing: TextButton(
          onPressed: () {
            // Implement edit functionality
          },
          child: workouts[index].done!
              ? Text('Completed', style: mainTextStyle)
              : Text('Not Completed', style: mainTextStyle),
        ),
      ),
    );
  }
}



// ignore: must_be_immutable

