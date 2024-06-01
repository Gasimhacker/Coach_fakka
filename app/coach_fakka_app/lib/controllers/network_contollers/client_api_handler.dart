import 'dart:convert';
import 'package:coach_fakka_app/controllers/network_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';

class ClientApiHandler {
  static Future<ClientModel> createNewClient(ClientModel newClient) async {
    String endPoint = '${newClient.coachId}/clients';
    String response = await NetworkHandler.postData(endPoint, newClient);
    return ClientModel.fromJson(json.decode(response));
  }

  static Future<ClientModel> getClient(String clientId) async {
    String endPoint = 'coaches/${clientId}';
    String response = await NetworkHandler.fetchData(endPoint);
    return ClientModel.fromJson(json.decode(response));
  }
  //TODO: implement the rest of the methods - The Update and Delete methods
}
