import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({@required this.onSignOut});

  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
//      await FirebaseAuth.instance.signOut();
      await Auth().signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
