import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/sign_in_screen.dart';
import 'package:time_tracker_flutter_course/screens/home_screen.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        // Checking if Stream has returned at least one value, but is not yet done.
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInScreen(auth: auth);
          }
          return HomeScreen(auth: auth);
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
