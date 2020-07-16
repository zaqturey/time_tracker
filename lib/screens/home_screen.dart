import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/platform_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

//  _confirmSingOut -> New method has been added to perform the following i.e.
//  1. to Build and Display a 'PlatformAlertDialog' (with Alert Actions)
//  2. Get the BOOL response from the selected/pressed 'Alert Action' and then assign it to 'isSignOutRequested'
//  3. Finally, call the '_signOut()' method if value for 'isSignOutRequested' is True.
  Future<void> _confirmSingOut(BuildContext context) async {
    final isSignOutRequested = await PlatformAlertDialog(
      title: 'Sign-Out',
      content: 'Are you sure to close session and logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);

    if (isSignOutRequested) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () => _confirmSingOut(context),
          ),
        ],
      ),
    );
  }
}
