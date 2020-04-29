import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/app_sign_in/email_sign_in_form.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSignInScreen extends StatelessWidget {
  final AuthBase auth;
  EmailSignInScreen({@required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(auth: auth),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
