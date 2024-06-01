import 'dart:convert';
import 'package:coach_fakka_app/controllers/network_contollers/network_handler.dart';
import 'package:coach_fakka_app/models/coach_model.dart';

class CoachApiHandler {
  static Future<CoachModel> createNewCoach(CoachModel newCoach) async {
    String endPoint = 'coaches/';
    String response = await NetworkHandler.postData(endPoint, newCoach);
    return CoachModel.fromJson(json.decode(response));
  }

  static Future<CoachModel> getCoach(String coachId) async {
    String endPoint = 'coaches/${coachId}';
    String response = await NetworkHandler.fetchData(endPoint);
    return CoachModel.fromJson(json.decode(response));
  }

  static Future<List<CoachModel>> getAllMyClients(String coachId) async {
    String endPoint = '${coachId}/clients';
    String response = await NetworkHandler.fetchData(endPoint);
    List<dynamic> coaches = json.decode(response);
    return coaches.map((coach) => CoachModel.fromJson(coach)).toList();
  }

  //TODO: implement the rest of the methods - The Update and Delete methods
}
