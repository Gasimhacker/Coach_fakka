import 'dart:convert';
import 'package:coach_fakka_app/controllers/client_controllers/client_network_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';

class ClientApiHandler {
  static Future<void> postNewClient(ClientModel newClient) async {
    String endPoint = '/${newClient.coachId}/clients';
    String response = await ClinetNetworkHandler.postData(endPoint, newClient);

    print(ClientModel.fromJson(json.decode(response)));

    // Add new client to database
  }

  static Future<ClientModel> getClientData(String clientId) async {
    String endPoint = '/api/v1/clients/$clientId';
    String response = await ClinetNetworkHandler.fetchData(endPoint);

    return ClientModel.fromJson(json.decode(response));
  }
}
