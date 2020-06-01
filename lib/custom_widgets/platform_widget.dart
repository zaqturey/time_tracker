import 'dart:io';

import 'package:flutter/material.dart';

// ====----Implementing Platform Independence----====
// Purpose of this Abstract class is: ->
// 1. Check the requesting Platform, and then build and return the requested Widgets accordingly
// 2. Note: as this is an Abstract class, the extending classes will override the Widget building/creation.

abstract class PlatformWidget extends StatelessWidget {
  Widget buildCupertinoWidget(BuildContext context);
  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoWidget(context);
    }
    return buildMaterialWidget(context);
  }
}
