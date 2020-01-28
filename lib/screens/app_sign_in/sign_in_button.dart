import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/custom_raised_button.dart';

// This class will not be returning any Widget, hence no 'build' is defined
// Constructor of this class accepts some values and Pass those to the Constructor of its SUPER class
// We have not used 'this.properties' syntax (which is common with Constructors in Dart) because this class doesn't declare any property at all.
// Also we created some of the Super class properties on the fly i.e. 'Text'

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
          color: color,
          onPressed: onPressed,
        );
}
