import 'package:flutter/material.dart';

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
      RaisedButton(
        child: Text('Sign In'),
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
