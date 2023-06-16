import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:strange/Strange/profile.dart';
import 'package:strange/functions/locator.dart';
import 'package:strange/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:strange/firebase_options.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/prof': (BuildContext context) => Profile(),}
    );
  }
}
