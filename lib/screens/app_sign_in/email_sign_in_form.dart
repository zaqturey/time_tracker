import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/form_submit_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/utils/validators/string_validator.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  final AuthBase auth;
  EmailSignInForm({@required this.auth});

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Creating Getters for 'email' and 'password'
  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  // Setting default value to '_formType'
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  // Setting default value to be used for 'Sign in' button i.e to check if it is pressed
  bool _isSubmitted = false;

  // Setting default value for '_isLoading' to disable 'Sign in' button while an 'auth' request is in progress
  bool _isLoading = false;



  void _toggleFormType() {
    setState(() {
      _isSubmitted = false;
      _formType = _formType == EmailSignInFormType.signIn ? EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  void _submit() async {
    setState(() {
      _isSubmitted = true;
      _isLoading = true;
    });
    try {
      // If current form is 'Sign In' form, calling firebase 'signInWithEmailAndPassword' method
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        // otherwise calling firebase 'createUserWithEmailAndPassword' method to Create a New Account
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } on Exception catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete() {
    // Change 'Focus' only when '_email' is Valid (NonEmpty in this case)
    final newFocus = widget.emailValidator.isValid(_email) ? _passwordFocusNode : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _updateState() {
    setState(() {});
  }

  TextField _buildEmailTextField() {
    // 'showErrorText' will only be TRUE if 'Sign in' button is pressed and '_email' field is Empty
    bool showErrorText = _isSubmitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@email.com',
        enabled: _isLoading == false,
        errorText: showErrorText ? widget.emptyEmailErrorText : null,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  TextField _buildPasswordTextField() {
    bool showErrorText = _isSubmitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        enabled: _isLoading == false,
        errorText: showErrorText ? widget.emptyPasswordErrorText : null,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign In';

    bool submitEnabled = widget.emailValidator.isValid(_email)
        && widget.passwordValidator.isValid(_password)
        && !_isLoading;

    bool isToggleFormEnabled = !_isLoading;

    return [
      _buildEmailTextField(),
      SizedBox(height: 10.0),
      _buildPasswordTextField(),
      SizedBox(height: 10.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(height: 10.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed: isToggleFormEnabled ? _toggleFormType : null,
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
