import 'package:coach_fakka_app/controllers/coach_contollers/coach_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:coach_fakka_app/models/coach_model.dart';

void main() async {
  ClientModel client = ClientModel(
    name: 'John Doe',
    id: '',
    coachId: '1111-1111-1111-1111',
    email: 'johndoe@gmail',
    gender: 'MALE',
    trainningPlace: 'Gym',
    injuryHistory: 'None',
    traiangDays: 3,
    activityLevel: 2,
    age: 25,
    height: 180,
    weight: 80,
    goalWeight: 75,
    traiangHours: 2.5,
    needSupplement: false,
  );

  CoachModel coach = CoachModel(name: 'Obada', email: 'Obada@gmail.com');

  // print(client.toJson());

  // print('');
  // print(coach.toJson());
  CoachModel cretedCoach =
      await CoachApiHandler.getCoach('62f31b5d-9193-4fcb-9e98-d5aaff84f61e');
  print(cretedCoach);
  print(cretedCoach.toJson());
}
