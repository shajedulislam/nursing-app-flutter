import 'package:flutter/material.dart';

import '../utilities/global_objects.dart';

class NavigationService {
  void push(Widget screen) {
    globalNavigatorKey.currentState?.push(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  void pop() {
    globalNavigatorKey.currentState?.pop();
  }

  void loader(Widget loader) {
    globalNavigatorKey.currentState?.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => loader,
      ),
    );
  }

  void pushRemoveAll(Widget route) {
    globalNavigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => route,
        ),
        (Route<dynamic> route) => false);
  }

  void pushReplace(Widget route) {
    globalNavigatorKey.currentState?.pushReplacement(MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => route,
    ));
  }
}
