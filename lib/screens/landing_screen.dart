import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/sign_in_screen.dart';
import 'package:time_tracker_flutter_course/screens/home_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // '_user' will be used to check if a User is logged in or Not (i.e. if its value is NULL or not)
  FirebaseUser _user;

  // Reference of method will be passed to the (SignInScreen's) 'onSignIn' function as a Callback.
  void _updateUser(FirebaseUser user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInScreen(
        // "onSignIn: (user) => _updateUser(user)" -> can be replaced using 'Callback shorthand syntax'
        // Callback -> Below 'onSignIn' Function, contains the reference/address of another Function i.e. '_updateUser'
        onSignIn: _updateUser,
      );
    }
    return HomeScreen(
      // Since '_updateUser' method accepts a 'FirebaseUser user', and as 'onSignOut' (in 'home_screen.dart') doesn't require an argument
      // hence passing the '_updateUser' Callback with NULL value
      onSignOut: () => _updateUser(null),
    );
  }
}
