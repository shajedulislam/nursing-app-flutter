import 'package:flutter/material.dart';
import 'package:nursingapp/controllers/task_controller.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:nursingapp/utilities/functions/navigation.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:ud_design/ud_design.dart';

import '../../../models/task_model.dart';

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
                ProText(
                  text: taskModel.task,
                  fontSize: UdDesign.fontSize(14),
                  color: ProjectColors.textDeep,
                ),
              ],
            ),
          ),
          taskModel.status == "pending"
              ? Row(
                  children: [
                    Expanded(
                      child: ProButtonBasic(
                        width: double.infinity,
                        height: UdDesign.pt(50),
                        borderRadius: UdDesign.pt(4),
                        text: "Mark as Done",
                        fontSize: UdDesign.fontSize(16),
                        backgroundColor: Colors.green[600],
                        onTap: () {
                          pop();
                          TaskController().updateStatus(docID);
                        },
                      ),
                    ),
                    ProGap(x: UdDesign.pt(16)),
                    Expanded(
                      child: ProButtonBasic(
                        width: double.infinity,
                        height: UdDesign.pt(50),
                        borderRadius: UdDesign.pt(4),
                        text: "Transfer",
                        fontSize: UdDesign.fontSize(16),
                        backgroundColor: Colors.red[600],
                        onTap: () {},
                      ),
                    )
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
