import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/custom_widgets/platform_alert_dialog_action.dart';
import 'package:time_tracker_flutter_course/custom_widgets/platform_widget.dart';

// ====----Implementing Platform Independent 'Alert Dialog'----====
// Purpose of this Abstract class is: ->
// To Build and Return a 'CupertinoAlertDialog' or an 'AlertDialog'
// (depending on the request from 'PlatformWidget')

class PlatformAlertDialog extends PlatformWidget {
  PlatformAlertDialog({
    @required this.title,
    @required this.content,
    this.cancelActionText,
    @required this.defaultActionText,
  })  : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);

  final String title;
  final String content;
  final String cancelActionText;
  final String defaultActionText;

  // below function can be called on the instance of the class, to display platform specific 'dialog'
  // Note: 'Dialog' is the parent window for 'AlertDialog' (you can instead display something else in a 'Dialog')
  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(context: context, builder: (context) => this)
        : await showDialog<bool>(context: context, barrierDismissible: false, builder: (context) => this);
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(
        PlatformAlertDialogAction(
          child: Text(cancelActionText),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      );
    }
    actions.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: () => Navigator.of(context).pop(true),
      ),
    );
    return actions;
  }
}
