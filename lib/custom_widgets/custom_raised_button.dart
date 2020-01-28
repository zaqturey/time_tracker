import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 2.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
