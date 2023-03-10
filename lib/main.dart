import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nursingapp/app.dart';
import 'package:nursingapp/controllers/shifts_controller.dart';
import 'package:nursingapp/controllers/task_controller.dart';
import 'package:nursingapp/services/locator.dart';
import 'package:provider/provider.dart';

import 'controllers/bottom_nav_controller.dart';
import 'controllers/signin_controller.dart';

void main() {
  appRunner();
}

appRunner() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await registerSingleton();
  await createInitalIntances();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => TaskController()),
        ChangeNotifierProvider(create: (_) => BottomNavController()),
        ChangeNotifierProvider(create: (_) => MyShiftController()),
      ],
      child: const App(),
    ),
  );
}
