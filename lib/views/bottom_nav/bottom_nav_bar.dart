import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pro_widgets/widgets/card.dart';
import 'package:ud_design/ud_design.dart';

import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProCard(
      height: Platform.isIOS ? UdDesign.pt(90) : UdDesign.pt(65),
      width: double.infinity,
      shadowOffset: const Offset(0, -1),
      shadowBlurRadius: 4,
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          BottomNavItem(
            index: 0,
            title: "Todo",
            iconData: Icons.pending_actions,
          ),
          BottomNavItem(
            index: 1,
            title: "Shifts",
            iconData: Icons.date_range,
          ),
          BottomNavItem(
            index: 2,
            title: "Profile",
            iconData: Icons.person,
          ),
        ],
      ),
    );
  }
}
