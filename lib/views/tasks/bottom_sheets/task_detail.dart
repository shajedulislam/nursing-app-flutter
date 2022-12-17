import 'package:flutter/material.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:ud_design/ud_design.dart';

import '../../../models/task_model.dart';
import '../../../utilities/functions/datetime_converter.dart';

class TaskDetailBottomSheet extends StatelessWidget {
  final TaskModel taskModel;
  final String docID;
  const TaskDetailBottomSheet({
    super.key,
    required this.taskModel,
    required this.docID,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UdDesign.pt(16)),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProText(
                      text: stringToDatetimeLocal(
                              dateTime: taskModel.date!,
                              pattern: "dd MMM, yyyy") ??
                          "",
                      fontSize: UdDesign.fontSize(14),
                      color: ProjectColors.navyDeep,
                    ),
                    ProCard(
                      borderRadius: UdDesign.pt(4),
                      backgroundColor: taskModel.status == "done"
                          ? Colors.green
                          : Colors.orangeAccent,
                      padding: EdgeInsets.all(UdDesign.pt(4)),
                      child: ProText(
                        text: taskModel.status?.toUpperCase() ?? "",
                        color: ProjectColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                ProGap(
                  y: UdDesign.pt(16),
                ),
                ProText(
                  text: taskModel.task,
                  fontSize: UdDesign.fontSize(14),
                  color: ProjectColors.textDeep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
