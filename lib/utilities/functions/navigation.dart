import 'package:flutter/material.dart';

import '../../services/navigation.dart';
import '../global_objects.dart';

void push({required Widget screen}) {
  localtor<NavigationService>().push(screen);
}

void pop() {
  localtor<NavigationService>().pop();
}

void pushReplace({required Widget screen}) {
  localtor<NavigationService>().pushReplace(screen);
}

void pushRemoveAll({required Widget screen}) {
  localtor<NavigationService>().pushRemoveAll(screen);
}

void loader({required Widget screen}) {
  localtor<NavigationService>().loader(screen);
}
