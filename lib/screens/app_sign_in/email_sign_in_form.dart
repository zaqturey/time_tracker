import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/form_submit_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  final AuthBase auth;
  EmailSignInForm({@required this.auth});

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Creating Getters for 'email' and 'password'
  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  // Setting default value to '_formType'
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() async {
    try {
      // If current form is 'Sign In' form, calling firebase 'signInWithEmailAndPassword' method
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        // otherwise calling firebase 'createUserWithEmailAndPassword' method
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn ? EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn ? 'Sign In' : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn ? 'Need an account? Register' : 'Have an account? Sign In';

    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(labelText: 'Email', hintText: 'test@email.com'),
      ),
      SizedBox(height: 10.0),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      SizedBox(height: 10.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: () => _submit(),
      ),
      SizedBox(height: 10.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed: _toggleFormType,
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
