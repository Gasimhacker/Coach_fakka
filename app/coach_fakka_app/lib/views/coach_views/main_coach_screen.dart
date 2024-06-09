import 'package:coach_fakka_app/controllers/network_controllers/coach_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/models/coach_model.dart';

import 'package:coach_fakka_app/utils/utils.dart';
import 'package:coach_fakka_app/views/coach_views/individual_client_screen.dart';
import 'package:coach_fakka_app/views/coach_views/widgets.dart';
import 'package:coach_fakka_app/views/workout_view/add_exercise.dart';
import 'package:flutter/material.dart';

class CoachMainScreen extends StatefulWidget {
  late final String coachId;
  CoachMainScreen({required this.coachId});
  @override
  State<CoachMainScreen> createState() => _CoachMainScreenState();
}

class _CoachMainScreenState extends State<CoachMainScreen> {
  late CoachModel currentCoach = CoachModel(name: ' ', email: ' ', id: ' ');
  late List<ClientModel> trainees = [];

  _initCall() async {
    currentCoach = await CoachApiHandler.getCoach(widget.coachId);
    trainees = await CoachApiHandler.getMyClients(widget.coachId);
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
                UserProfilePic(
                  imagePath: dummyImagePath,
                ),
                SizedBox(height: 10),
                UserNameWidget(
                  userName: currentCoach.name!,
                ),
                SizedBox(height: 20),
                SearchBarWidget(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trainees.length, // Replace with your data
              itemBuilder: (context, index) {
                return TraineesListTile(index);
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

  Widget TraineesListTile(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: mainColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        // leading: CircleAvatar(
        //   backgroundImage: AssetImage(
        //     [index].imagePath,
        //   ), // Replace with trainee images
        // ),
        title: Text(
          trainees[index].name!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Coiny',
          ),
        ), // Replace with trainee names
        trailing: TextButton(
          onPressed: () {
            // Implement edit functionality
            // GET TRAINEE ID : traineeList[index].id
            // GOTO : individual trainee screen
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IndividualClientView(
                  clientID: trainees[index].id!, coachID: widget.coachId);
            }));
          },
          child: Text('Train',
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'Coiny')),
        ),
      ),
    );
  }
}

class CoachDrawer extends StatelessWidget {
  final ValueNotifier<bool> _showFeatureLater = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
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
                  _showFeatureLater.value = !_showFeatureLater.value;
                },
              ),
              ListTile(
                title: Text(
                  'Add Exercise',
                  style: TextStyle(color: mainColor, fontFamily: 'Coiny'),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddExercies();
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

// ignore: must_be_immutabl
class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          color: thirdColor,
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
