import 'package:flutter/material.dart';
import 'package:ud_design/ud_design.dart';

import 'utilities/functions/middlewears.dart';
import 'views/waiting_screen.dart';

class Middlewear extends StatefulWidget {
  const Middlewear({Key? key}) : super(key: key);

  @override
  State<Middlewear> createState() => _MiddlewearState();
}

class _MiddlewearState extends State<Middlewear> {
  @override
  void initState() {
    rootMiddleWear(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UdDesign.init(context);
    return const WatitingScreen();
  }
}
