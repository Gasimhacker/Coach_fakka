import 'package:coach_fakka_app/controllers/network_controllers/client_api_handler.dart';

import 'package:coach_fakka_app/controllers/network_controllers/workout_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/models/workout_model.dart';
import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/coach_views/main_coach_screen.dart';
import 'package:coach_fakka_app/views/coach_views/widgets.dart';
import 'package:flutter/material.dart';

class ClientMainScreen extends StatefulWidget {
  final String clientId;
  ClientMainScreen({required this.clientId});

  @override
  State<ClientMainScreen> createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  static late ClientModel currentClient =
      ClientModel(name: ' ', email: ' ', id: ' ');
  List<WorkoutModel> workouts = [];

  _initCall() async {
    currentClient = await ClientApiHandler.getClient(widget.clientId);

    workouts = await WorkoutAPIHandler.getMyWorkouts(widget.clientId);
    setState(() {});
  }

  @override
  void initState() {
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserMainAppBar(),
      backgroundColor: thirdColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                UserProfilePic(
                  imagePath: dummyImagePath,
                ),
                SizedBox(height: 10),
                UserNameWidget(
                  userName: currentClient.name!,
                ),
                SizedBox(height: 20),
                SearchBarWidget(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workouts.length, // Replace with your data
              itemBuilder: (context, index) {
                return WorkoutListTile(index: index);
              },
            ),
          ),
        ],
      ),
      drawer: ClientDrawer(),
    );
  }

  WorkoutListTile({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: workouts[index].done! ? mainColor : secondaryColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(30, 0, 10, 0),

        leading: Text(workouts[index].name!, style: mainTextStyle),
        // title: Center(
        //   child: Text('Date: ${_formatDate(workouts[index].created_at!)}',
        //       style: mainTextStyle),
        // ), // Replace with trainee names
        trailing: Checkbox(
          value: workouts[index].done,
          onChanged: (value) async {
            setState(() {
              workouts[index].done = value!;
            });
            await WorkoutAPIHandler.updateWorkout(
                widget.clientId, workouts[index]);
          },
        ),
      ),
    );
  }
}

class ClientDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      userName: _ClientMainScreenState.currentClient.name!,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: mainColor,
                ),
              ),
              ListTile(
                title: Text(
                  'My Coach',
                  style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
                ),
                onTap: () {
                  _showFeatureLater.value = !_showFeatureLater.value;
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
              ListTile(
                title: Text(
                  'Logout',
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
}
