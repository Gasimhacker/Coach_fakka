import 'package:coach_fakka_app/controllers/network_handler.dart';
import 'package:coach_fakka_app/models/coach_model.dart';

class CoachApi {
  CoachModel coach = CoachModel();
  NetworkHandler networkHandler = NetworkHandler();

  Future<List<CoachModel>> fetchAll() async {
    final response = await networkHandler.fetchData('coaches');
    List<CoachModel> coaches = [];
    for (var item in response) {
      coaches.add(CoachModel.fromJson(item));
    }
    return coaches;
  }
}
