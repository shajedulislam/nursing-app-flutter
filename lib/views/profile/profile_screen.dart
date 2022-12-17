import 'package:flutter/material.dart';
import 'package:nursingapp/controllers/bottom_nav_controller.dart';
import 'package:nursingapp/controllers/signin_controller.dart';
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
          SafeArea(
            child: Row(
              children: [
                ProShape(
                  height: UdDesign.pt(50),
                  width: UdDesign.pt(50),
                  radius: UdDesign.pt(25),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: UdDesign.pt(28),
                  ),
                ),
                ProGap(x: UdDesign.pt(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProText(
                      text:
                          "${context.read<SigninController>().userModel?.name}",
                      fontSize: UdDesign.fontSize(16),
                      color: ProjectColors.navyDeep,
                      fontWeight: FontWeight.bold,
                    ),
                    ProGap(y: UdDesign.pt(2)),
                    ProText(
                      text:
                          "${context.read<SigninController>().userModel?.email}",
                      fontSize: UdDesign.fontSize(14),
                      color: ProjectColors.navyDeep,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )
              ],
            ),
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
