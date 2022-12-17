import 'package:flutter/material.dart';
import 'package:nursingapp/controllers/bottom_nav_controller.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../services/shared_preference.dart';
import '../../utilities/constants/colors.dart';
import '../../utilities/functions/navigation.dart';
import '../../utilities/global_objects.dart';
import '../signin/signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UdDesign.pt(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [],
          ),
          ProButtonBasic(
            width: double.infinity,
            height: UdDesign.pt(50),
            borderRadius: UdDesign.pt(4),
            text: "Logout",
            fontSize: UdDesign.fontSize(16),
            backgroundColor: ProjectColors.blueDeep,
            onTap: () {
              localtor<SharedPreferenceServices>().clear();
              context.read<BottomNavController>().selectedItem = 0;
              pushRemoveAll(screen: SigninScreen());
            },
          ),
        ],
      ),
    );
  }
}
