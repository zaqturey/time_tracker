import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/sign_in_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // '_user' will be used to check if a User is logged in or Not (i.e. if if its value is NULL or not)
  FirebaseUser _user;

  // Below method will be passed to the 'onSignIn' Callback of the 'SignInScreen()'
  void _updateUser(FirebaseUser user) {
    print('User id: ${user.uid}');
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInScreen(
        // "onSignIn: (user) => _updateUser(user)" --> can be replaced using 'Callback shorthand syntax'
        onSignIn: _updateUser,
      );
    }
    return Container();
  }
}
