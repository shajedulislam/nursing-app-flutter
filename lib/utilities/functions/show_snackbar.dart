import 'package:flutter/material.dart';
import 'package:pro_widgets/widgets/texts/text.dart';
import 'package:ud_design/ud_design.dart';

import '../global_objects.dart';

void showSnackbar({
  required String text,
}) {
  final ScaffoldMessengerState? scaffoldMessengerState =
      globalScaffoldMessengerKey.currentState;
  if (scaffoldMessengerState != null) {
    scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: ProText(
          text: text,
          fontSize: UdDesign.fontSize(14),
          color: Colors.white,
        ),
      ),
    );
  }
}
