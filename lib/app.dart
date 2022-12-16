import 'package:flutter/material.dart';
import 'package:nursingapp/middlewear.dart';

import 'utilities/global_objects.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globalNavigatorKey,
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      title: "Nursing App",
      home: const Middlewear(),
    );
  }
}
