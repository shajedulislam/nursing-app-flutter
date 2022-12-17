import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nursingapp/controllers/task_controller.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:nursingapp/utilities/functions/gesture.dart';
import 'package:nursingapp/utilities/functions/navigation.dart';
import 'package:nursingapp/utilities/global_objects.dart';
import 'package:nursingapp/utilities/widgets/radio_button.dart';
import 'package:nursingapp/views/tasks/screens/create_task/bottom_sheets/resident_list.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../../../utilities/functions/null_check.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unFocus(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: UdDesign.pt(16),
            right: UdDesign.pt(16),
            bottom: UdDesign.pt(16),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: UdDesign.pt(16)),
                  children: [
                    ProTextFormField(
                      labelFontSize: UdDesign.fontSize(14),
                      labelFontColor: ProjectColors.textDeep,
                      paddingVertical: UdDesign.pt(17),
                      hint: "Write about task",
                      hintFontSize: UdDesign.fontSize(14),
                      hintColor: ProjectColors.textLight,
                      borderRadius: UdDesign.pt(4),
                      borderColor: ProjectColors.border,
                      fontSize: UdDesign.fontSize(14),
                      fontColor: ProjectColors.textDeep,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      errorFontSize: UdDesign.fontSize(12),
                      validator: (value) {
                        if (isNull(value)) {
                          return 'Email can not be empty';
                        } else {
                          context.read<TaskController>().taskCreateModel.task =
                              value;
                        }
                        return null;
                      },
                    ),
                    const ProGap(y: 16),
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
                          globalNavigatorKey.currentContext
                                  ?.read<TaskController>()
                                  .taskCreateModel
                                  .date =
                              DateFormat("yyyy-MM-dd").format(pickedDate);
                          setState(() {
                            selectedDate =
                                DateFormat("yyyy-MM-dd").format(pickedDate);
                          });
                        }
                      },
                      child: ProCard(
                        padding:
                            EdgeInsets.symmetric(horizontal: UdDesign.pt(8)),
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
                              text: selectedDate ?? "Select date",
                              fontSize: UdDesign.fontSize(14),
                              fontWeight: FontWeight.w500,
                              color: selectedDate != null
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
                    ProTapper(
                      padding: const EdgeInsets.all(0),
                      onTap: () async {
                        proBottomSheet(
                          context: context,
                          appBarTitle: "Select resident",
                          sheetBody: const ResidentListBottomSheet(),
                        );
                      },
                      child: ProCard(
                        padding:
                            EdgeInsets.symmetric(horizontal: UdDesign.pt(8)),
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
                              text: context
                                      .read<TaskController>()
                                      .taskCreateModel
                                      .patient ??
                                  "Select resident",
                              fontSize: UdDesign.fontSize(14),
                              fontWeight: FontWeight.w500,
                              color: context
                                          .read<TaskController>()
                                          .taskCreateModel
                                          .patient !=
                                      null
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
                    Row(
                      children: [
                        ProRadioButton(
                          title: "Morning",
                          value: "morning",
                          checked: context
                                  .watch<TaskController>()
                                  .taskCreateModel
                                  .shift ==
                              "morning",
                          onTap: (value) {
                            context
                                .read<TaskController>()
                                .taskCreateModel
                                .shift = value;
                            context.read<TaskController>().notify();
                          },
                        ),
                        ProGap(x: UdDesign.pt(16)),
                        ProRadioButton(
                          title: "Evening",
                          value: "evening",
                          checked: context
                                  .watch<TaskController>()
                                  .taskCreateModel
                                  .shift ==
                              "evening",
                          onTap: (value) {
                            context
                                .read<TaskController>()
                                .taskCreateModel
                                .shift = value;
                            context.read<TaskController>().notify();
                          },
                        ),
                        ProGap(x: UdDesign.pt(16)),
                        ProRadioButton(
                          title: "Night",
                          value: "night",
                          checked: context
                                  .watch<TaskController>()
                                  .taskCreateModel
                                  .shift ==
                              "night",
                          onTap: (value) {
                            context
                                .read<TaskController>()
                                .taskCreateModel
                                .shift = value;
                            context.read<TaskController>().notify();
                          },
                        ),
                      ],
                    ),
                    const ProGap(y: 16),
                  ],
                ),
              ),
              ProButtonBasic(
                width: double.infinity,
                height: UdDesign.pt(50),
                borderRadius: UdDesign.pt(4),
                text: "Create",
                fontSize: UdDesign.fontSize(16),
                backgroundColor: ProjectColors.blueDeep,
                onTap: () {
                  context.read<TaskController>().createTask();
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
      ),
    );
  }
}
