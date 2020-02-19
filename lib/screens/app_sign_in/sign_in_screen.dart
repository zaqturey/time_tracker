import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInScreen extends StatelessWidget {
  // defining a parameterized Constructor that takes a 'Function' and
  // an Instance of 'AuthBase' as a mandatory argument.
  SignInScreen({@required this.onSignIn, @required this.auth});

  // As we want a Callback from this Screen to Inform the LandingScreen whenever
  // a User has clicked/performed 'SignIn' anonymously, hence defining a custom Callback i.e. 'onSignIn'
  // Below we r defining a 'Function Variable' that takes 'FirebaseUser' as an argument
  final Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      User user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        // 'elevation' is used to add shadow to the AppBar
        elevation: 4.0,
      ),
      backgroundColor: Colors.grey[200],
      body: _buildContainer(),
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
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'assets/images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'assets/images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            'OR',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            // Note: Since 'onPressed' (callback) and '_signInAnonymously' (method) both accepts no arguments and returns no Value,
            // it is allowed to use the below signature instead of using a closure syntax i.e.  "onPressed: () => _signInAnonymously()".
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
