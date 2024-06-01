import 'package:flutter/material.dart';

class ClientMainScreen extends StatefulWidget {
  final String? clientId;
  ClientMainScreen({this.clientId});

  @override
  State<ClientMainScreen> createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
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
