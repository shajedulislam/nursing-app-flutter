import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../../../controllers/task_controller.dart';
import '../../../../models/task_model.dart';
import '../../../../utilities/constants/colors.dart';
import '../../../../utilities/functions/navigation.dart';
import '../../../../utilities/widgets/radio_button.dart';

class MoveTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  final String docID;
  const MoveTaskScreen({
    super.key,
    required this.taskModel,
    required this.docID,
  });

  @override
  State<MoveTaskScreen> createState() => _MoveTaskScreenState();
}

class _MoveTaskScreenState extends State<MoveTaskScreen> {
  TaskModel updateTaskModel = TaskModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(UdDesign.pt(16)),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ProTapper(
                    padding: const EdgeInsets.all(0),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 7)));
                      if (pickedDate != null) {
                        setState(() {
                          updateTaskModel.date =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                        });
                      }
                    },
                    child: ProCard(
                      padding: EdgeInsets.symmetric(horizontal: UdDesign.pt(8)),
                      disableShadow: true,
                      borderColor: ProjectColors.border,
                      borderWidth: UdDesign.pt(1),
                      borderRadius: UdDesign.pt(4),
                      width: double.infinity,
                      height: UdDesign.pt(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProText(
                            text: updateTaskModel.date ?? "Select date",
                            fontSize: UdDesign.fontSize(14),
                            fontWeight: FontWeight.w500,
                            color: updateTaskModel.date != null
                                ? ProjectColors.textDeep
                                : ProjectColors.textLight,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: UdDesign.pt(20),
                            color: ProjectColors.blueDeep,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ProGap(y: 16),
                  updateTaskModel.date != null
                      ? DateFormat("yyyy-MM-dd").format(DateTime.now()) !=
                              updateTaskModel.date
                          ? Row(
                              children: [
                                ProRadioButton(
                                  title: "Morning",
                                  value: "morning",
                                  checked: updateTaskModel.shift == "morning",
                                  onTap: (value) {
                                    setState(() {
                                      updateTaskModel.shift = value;
                                    });
                                  },
                                ),
                                ProGap(x: UdDesign.pt(16)),
                                ProRadioButton(
                                  title: "Evening",
                                  value: "evening",
                                  checked: updateTaskModel.shift == "evening",
                                  onTap: (value) {
                                    setState(() {
                                      updateTaskModel.shift = value;
                                    });
                                  },
                                ),
                                ProGap(x: UdDesign.pt(16)),
                                ProRadioButton(
                                  title: "Night",
                                  value: "night",
                                  checked: updateTaskModel.shift == "night",
                                  onTap: (value) {
                                    setState(() {
                                      updateTaskModel.shift = value;
                                    });
                                  },
                                ),
                              ],
                            )
                          : widget.taskModel.shift == "morning"
                              ? Row(
                                  children: [
                                    ProRadioButton(
                                      title: "Evening",
                                      value: "evening",
                                      checked:
                                          updateTaskModel.shift == "evening",
                                      onTap: (value) {
                                        setState(() {
                                          updateTaskModel.shift = value;
                                        });
                                      },
                                    ),
                                    ProGap(x: UdDesign.pt(16)),
                                    ProRadioButton(
                                      title: "Night",
                                      value: "night",
                                      checked: updateTaskModel.shift == "night",
                                      onTap: (value) {
                                        setState(() {
                                          updateTaskModel.shift = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : widget.taskModel.shift == "evening"
                                  ? Row(
                                      children: [
                                        ProRadioButton(
                                          title: "Night",
                                          value: "night",
                                          checked:
                                              updateTaskModel.shift == "night",
                                          onTap: (value) {
                                            setState(() {
                                              updateTaskModel.shift = value;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink()
                      : const SizedBox.shrink()
                ],
              ),
            ),
            ProButtonBasic(
              width: double.infinity,
              height: UdDesign.pt(50),
              borderRadius: UdDesign.pt(4),
              text: "Move",
              fontSize: UdDesign.fontSize(16),
              backgroundColor: ProjectColors.blueDeep,
              onTap: () {
                if (updateTaskModel.date != null &&
                    updateTaskModel.shift != null) {
                  context.read<TaskController>().moveTask(
                        date: updateTaskModel.date!,
                        docID: widget.docID,
                        shift: updateTaskModel.shift!,
                      );
                }
                pop();
              },
            ),
            Platform.isIOS
                ? ProGap(
                    y: UdDesign.pt(16),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
