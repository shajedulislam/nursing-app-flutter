import 'package:flutter/material.dart';
import 'package:nursingapp/controllers/shifts_controller.dart';
import 'package:nursingapp/models/shift_model.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../controllers/signin_controller.dart';
import '../../utilities/constants/colors.dart';
import '../../utilities/enums/data_state.dart';
import '../../utilities/widgets/loader.dart';

class MyShiftScreen extends StatefulWidget {
  const MyShiftScreen({super.key});

  @override
  State<MyShiftScreen> createState() => _MyShiftScreenState();
}

class _MyShiftScreenState extends State<MyShiftScreen> {
  @override
  void initState() {
    context.read<MyShiftController>().reset().then((_) {
      context
          .read<MyShiftController>()
          .getMyShifts(context.read<SigninController>().userModel!.email!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shiftController = context.watch<MyShiftController>();
    return Column(
      children: [
        ProCard(
          height: UdDesign.pt(75),
          borderRadius: 0,
          padding: EdgeInsets.only(
            top: UdDesign.pt(28),
            left: UdDesign.pt(16),
            right: UdDesign.pt(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProText(
                text: "My Shifts",
                color: ProjectColors.navyDeep,
                fontSize: UdDesign.fontSize(16),
              ),
            ],
          ),
        ),
        Expanded(
          child: shiftController.shiftDataState == DataState.empty
              ? Center(
                  child: ProText(
                    text: 'No shifts found.',
                    fontSize: UdDesign.fontSize(14),
                    color: ProjectColors.navyDeep,
                  ),
                )
              : shiftController.shiftDataState == DataState.error
                  ? Center(
                      child: ProText(
                        text: 'Something went wrong.',
                        fontSize: UdDesign.fontSize(14),
                        color: ProjectColors.navyDeep,
                      ),
                    )
                  : shiftController.shiftDataState == DataState.loaded
                      ? ListView(
                          padding: EdgeInsets.all(UdDesign.pt(16)),
                          children: shiftController.myShifts.map((shift) {
                            ShiftModel shiftModel = ShiftModel.fromJson(shift);
                            return Padding(
                              padding: EdgeInsets.only(bottom: UdDesign.pt(16)),
                              child: ProCard(
                                disableShadow: true,
                                padding: EdgeInsets.all(UdDesign.pt(8)),
                                borderColor: ProjectColors.border,
                                borderWidth: UdDesign.pt(0.8),
                                borderRadius: UdDesign.pt(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ProText(
                                      text:
                                          "${shiftModel.shiftType?.toUpperCase()}",
                                      fontSize: UdDesign.fontSize(18),
                                      color: ProjectColors.blueDeep,
                                    ),
                                    ProGap(
                                      y: UdDesign.pt(8),
                                    ),
                                    ProText(
                                      text: shiftModel.date,
                                      fontSize: UdDesign.fontSize(14),
                                      color: ProjectColors.navyDeep,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      : const ProLoader(),
        )
      ],
    );
  }
}
