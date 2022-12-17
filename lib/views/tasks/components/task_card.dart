import 'package:flutter/material.dart';

import 'package:nursingapp/models/task_model.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:nursingapp/utilities/functions/navigation.dart';
import 'package:nursingapp/views/tasks/screens/move_task/move_task_screen.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:ud_design/ud_design.dart';

import '../../../utilities/functions/datetime_converter.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final String docID;
  const TaskCard({super.key, required this.taskModel, required this.docID});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UdDesign.pt(8),
        left: UdDesign.pt(0),
        right: UdDesign.pt(16),
        bottom: UdDesign.pt(8),
      ),
      child: ProCard(
        height: UdDesign.pt(80),
        padding: const EdgeInsets.all(0),
        borderRadius: UdDesign.pt(8),
        child: Row(
          children: [
            ProShape(
              height: double.infinity,
              width: UdDesign.pt(12),
              color: taskModel.status == "done"
                  ? Colors.green
                  : Colors.orangeAccent,
              customRadius: BorderRadius.only(
                bottomLeft: Radius.circular(UdDesign.pt(8)),
                bottomRight: const Radius.circular(0),
                topLeft: Radius.circular(UdDesign.pt(8)),
                topRight: const Radius.circular(0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(UdDesign.pt(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProText(
                      text: taskModel.task,
                      fontSize: UdDesign.fontSize(14),
                      color: ProjectColors.navyDeep,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                        taskModel.status != "done"
                            ? ProTapper(
                                padding: const EdgeInsets.all(0),
                                onTap: () {
                                  push(
                                    screen: MoveTaskScreen(
                                      taskModel: taskModel,
                                      docID: docID,
                                    ),
                                  );
                                },
                                child: ProCard(
                                  borderRadius: UdDesign.pt(4),
                                  backgroundColor: Colors.red[600],
                                  padding: EdgeInsets.symmetric(
                                      vertical: UdDesign.pt(4),
                                      horizontal: UdDesign.pt(8)),
                                  child: const ProText(
                                    text: "Move",
                                    color: ProjectColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
