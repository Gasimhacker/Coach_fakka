import 'package:coach_fakka_app/models/client_model.dart';

void main() {
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

  print(client.toJson());
}
