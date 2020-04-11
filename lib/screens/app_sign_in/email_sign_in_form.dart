import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(labelText: 'Email', hintText: 'test@email.com'),
      ),
      SizedBox(height: 10.0),
      TextField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password'),
      ),
      SizedBox(height: 10.0),
      FormSubmitButton(
        text: 'Sign In',
        onPressed: () {},
      ),
      SizedBox(height: 10.0),
      FlatButton(
        child: Text('Need an account? Register'),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
