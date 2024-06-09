import 'package:flutter/material.dart';

showSnack(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.deepPurple,
      content: Text(message),
    ),
  );
}
