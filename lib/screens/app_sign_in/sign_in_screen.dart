import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/custom_raised_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        // 'elevation' is used to add shadow to the AppBar
        elevation: 4.0,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          CustomRaisedButton(
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
              ),
            ),
            color: Colors.white,
            borderRadius: 8.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
