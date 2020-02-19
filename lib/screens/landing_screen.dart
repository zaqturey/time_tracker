import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/sign_in_screen.dart';
import 'package:time_tracker_flutter_course/screens/home_screen.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({@required this.auth});
  final AuthBase auth;

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // '_user' will be used to check if a User is logged in or Not (i.e. if its value is NULL or not)
  User _user;

  // 'initState()' Will be called each time app is restarted and hence '_checkCurrentUser()' as well.
  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  // Function '_checkCurrentUser' will verify if User the is logged In or Not,
  // and if User is logged in and App is restarted, User will remain logged In,
  // as '_updateUser(user)' is called each time APP is restarted.
  Future<void> _checkCurrentUser() async {
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  // Reference of method will be passed to the (SignInScreen's) 'onSignIn' function as a Callback.
  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInScreen(
        auth: widget.auth,
        // "onSignIn: (user) => _updateUser(user)" -> can be replaced using 'Callback shorthand syntax'
        // Callback -> Below 'onSignIn' Function, contains the reference/address of another Function i.e. '_updateUser'
        onSignIn: _updateUser,
      );
    }
    return HomeScreen(
      auth: widget.auth,
      // Since '_updateUser' method accepts a 'FirebaseUser user', and as 'onSignOut' (in 'home_screen.dart') doesn't require an argument
      // hence passing the '_updateUser' Callback with NULL value
      onSignOut: () => _updateUser(null),
    );
  }
}
