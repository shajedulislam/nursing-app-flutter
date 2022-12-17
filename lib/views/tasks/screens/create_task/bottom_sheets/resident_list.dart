import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nursingapp/controllers/resident_controller.dart';
import 'package:nursingapp/controllers/task_controller.dart';
import 'package:nursingapp/models/resident_model.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:nursingapp/utilities/functions/navigation.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../../../../utilities/constants/strings.dart';
import '../../../../../utilities/widgets/loader.dart';

class ResidentListBottomSheet extends StatelessWidget {
  const ResidentListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ResidentController().getResidents(),
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        if (snapshot.hasError) {
          return Center(
            child: ProText(
              text: ProjectStrings.wentWrong,
              fontSize: UdDesign.fontSize(14),
              color: ProjectColors.navyDeep,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProLoader();
        }

        return ListView(
          padding: EdgeInsets.all(UdDesign.pt(16)),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            ResidentModel residentModel = ResidentModel.fromJson(data);

            return Padding(
              padding: EdgeInsets.only(bottom: UdDesign.pt(16)),
              child: ProTapper(
                padding: const EdgeInsets.all(0),
                onTap: () {
                  context.read<TaskController>().taskCreateModel.patient =
                      residentModel.email;
                  context.read<TaskController>().notify();
                  pop();
                },
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
                        text: residentModel.name,
                        fontSize: UdDesign.fontSize(14),
                        color: ProjectColors.navyDeep,
                      ),
                      ProGap(
                        y: UdDesign.pt(8),
                      ),
                      ProText(
                        text: "Bed: ${residentModel.bedNumber}",
                        fontSize: UdDesign.fontSize(12),
                        color: ProjectColors.navyDeep,
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
