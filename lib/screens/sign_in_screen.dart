import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        // 'elevation' is used to add shadow to the AppBar
        elevation: 4.0,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.orange,
              child: SizedBox(
                height: 100.0,
              ),
            ),
            Container(
              color: Colors.red,
              child: SizedBox(
                height: 100.0,
              ),
            ),
            Container(
              color: Colors.purple,
              child: SizedBox(
                height: 100.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
