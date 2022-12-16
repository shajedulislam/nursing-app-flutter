import 'package:flutter/material.dart';

import '../utilities/constants/colors.dart';
import '../utilities/widgets/loader.dart';

class WatitingScreen extends StatelessWidget {
  const WatitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ProjectColors.navyDeep,
      body: Center(
        child: ProLoader(
          color: ProjectColors.white,
        ),
      ),
    );
  }
}
