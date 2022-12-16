import 'package:flutter/material.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../../controllers/bottom_nav_controller.dart';
import '../../../utilities/constants/colors.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final String title;
  final IconData iconData;
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProTapper(
      padding: EdgeInsets.symmetric(horizontal: UdDesign.pt(6)),
      onTap: () {
        context.read<BottomNavController>().changeItemIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: UdDesign.pt(24),
            color: context.watch<BottomNavController>().selectedItem == index
                ? ProjectColors.blueDeep
                : ProjectColors.navyDeep,
          ),
          ProGap(y: UdDesign.pt(6)),
          ProText(
            text: title,
            color: context.watch<BottomNavController>().selectedItem == index
                ? ProjectColors.blueDeep
                : ProjectColors.navyDeep,
            fontSize: UdDesign.fontSize(10),
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
