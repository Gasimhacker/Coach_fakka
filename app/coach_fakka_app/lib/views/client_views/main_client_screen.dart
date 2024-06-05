import 'package:coach_fakka_app/controllers/network_controllers/client_api_handler.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:flutter/material.dart';

class ClientMainScreen extends StatefulWidget {
  final String clientId;
  ClientMainScreen({required this.clientId});

  @override
  State<ClientMainScreen> createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  late ClientModel currentClient = ClientModel(name: ' ', email: ' ', id: ' ');

  _initCall() async {
    currentClient = await ClientApiHandler.getClient(widget.clientId);
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
      appBar: AppBar(
        title: Text('Client Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${widget.clientId} Main Screen ',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
