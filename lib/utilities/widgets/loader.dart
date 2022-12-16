import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';

class ProLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  const ProLoader({Key? key, this.color, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      key: key,
      child: SpinKitRing(
        color: color ?? ProjectColors.blueDeep,
        size: size ?? 50,
        lineWidth: 4,
      ),
    );
  }
}
