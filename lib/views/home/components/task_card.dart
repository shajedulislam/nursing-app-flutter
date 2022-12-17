import 'package:flutter/material.dart';

import 'package:nursingapp/models/task_model.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:ud_design/ud_design.dart';

import '../../../utilities/functions/datetime_converter.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  const TaskCard({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: UdDesign.pt(8),
        horizontal: UdDesign.pt(16),
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