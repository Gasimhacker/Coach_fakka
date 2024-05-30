import 'dart:convert';
import 'package:coach_fakka_app/controllers/client_controllers/client_network_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';

class ClientApiHandler {
  static Future<ClientModel> postNewClient(ClientModel newClient) async {
    String endPoint = '/api/v1/${newClient.coachId}/clients';
    String response = await ClinetNetworkHandler.postData(endPoint, newClient);

    return ClientModel.fromJson(json.decode(response));

    // Add new client to database
  }
}
