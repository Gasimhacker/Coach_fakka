import 'package:coach_fakka_app/views/main_screen.dart';
import 'package:coach_fakka_app/views/register_views/coach_login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAjqV7YmgQc5sRjFlzBG5CS84R05c4VYCc',
      appId: '1:577108779906:android:c34c54ca86615bfe57e59b',
      messagingSenderId: '577108779906',
      projectId: 'coach-fakka',
      storageBucket: 'coach-fakka.appspot.com',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coach Fakka App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: CoachLogin(),
      ),
    );
  }
}
