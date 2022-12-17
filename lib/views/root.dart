import 'package:flutter/material.dart';
import 'package:nursingapp/views/tasks/task_screen.dart';
import 'package:nursingapp/views/shifts/my_shifts_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/bottom_nav_controller.dart';
import 'bottom_nav/bottom_nav_bar.dart';
import 'profile/profile_screen.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedNavItem = context.watch<BottomNavController>().selectedItem;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Offstage(
            offstage: selectedNavItem != 0,
            child: TickerMode(
              enabled: selectedNavItem == 0,
              child: const TaskScreen(),
            ),
          ),
          Offstage(
            offstage: selectedNavItem != 1,
            child: TickerMode(
              enabled: selectedNavItem == 1,
              child: const MyShiftScreen(),
            ),
          ),
          Offstage(
            offstage: selectedNavItem != 2,
            child: TickerMode(
              enabled: selectedNavItem == 2,
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
