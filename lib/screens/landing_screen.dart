import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/sign_in_screen.dart';
import 'package:time_tracker_flutter_course/screens/home_screen.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';
import 'package:time_tracker_flutter_course/services/user.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        // Checking if Stream has returned at least one value, but is not yet done.
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInScreen();
          }
          return HomeScreen();
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
