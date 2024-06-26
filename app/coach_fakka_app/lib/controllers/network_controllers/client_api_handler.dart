import 'dart:convert';
import 'package:coach_fakka_app/controllers/network_controllers/network_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';

class ClientApiHandler {
  static Future<ClientModel> createNewClient(ClientModel newClient) async {
    String endPoint = '${newClient.coach_id}/clients';
    String response = await NetworkHandler.postData(endPoint, newClient);
    return ClientModel.fromJson(json.decode(response));
  }

  static Future<ClientModel> getClient(String clientId) async {
    String endPoint = 'clients/${clientId}';
    String response = await NetworkHandler.fetchData(endPoint);
    return ClientModel.fromJson(json.decode(response));
  }

  static Future<bool> isClient(String clientId) async {
    String endPoint = 'clients/${clientId}';
    String response = await NetworkHandler.fetchData(endPoint);
    if (response == '404') {
      return false;
    } else {
      return true;
    }
  }
  //TODO: implement the rest of the methods - The Update and Delete methods
}
