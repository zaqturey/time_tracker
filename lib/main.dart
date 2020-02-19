import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/landing_screen.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time Tracker",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingScreen(
        auth: Auth(),
      ),
    );
  }
}
