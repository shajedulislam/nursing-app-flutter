import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nursingapp/controllers/signin_controller.dart';
import 'package:nursingapp/controllers/task_controller.dart';
import 'package:nursingapp/models/task_model.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:nursingapp/utilities/constants/strings.dart';
import 'package:nursingapp/utilities/enums/data_state.dart';
import 'package:nursingapp/utilities/functions/navigation.dart';
import 'package:nursingapp/utilities/widgets/loader.dart';
import 'package:nursingapp/utilities/widgets/radio_button.dart';
import 'package:nursingapp/views/tasks/components/task_card.dart';
import 'package:nursingapp/views/tasks/screens/create_task/create_task_screen.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import 'bottom_sheets/task_detail.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    context
        .read<TaskController>()
        .getShifts(context.read<SigninController>().userModel!.email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var taskController = context.watch<TaskController>();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProText(
                text: "Tasks",
                color: ProjectColors.navyDeep,
                fontSize: UdDesign.fontSize(16),
              ),
              ProTapper(
                padding: EdgeInsets.all(UdDesign.pt(4)),
                child: Icon(
                  Icons.add,
                  color: ProjectColors.blueDeep,
                  size: UdDesign.pt(24),
                ),
                onTap: () {
                  taskController.resetCreateTask().then((_) => push(
                        screen: const CreateTaskScreen(),
                      ));
                },
              )
            ],
          ),
        ),
        Expanded(
          child: taskController.shiftDataState == DataState.loaded
              ? StreamBuilder<QuerySnapshot>(
                  stream:
                      TaskController().getTodoList(taskController.shiftModel!),
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
                      padding: EdgeInsets.only(top: UdDesign.pt(8)),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        TaskModel taskModel = TaskModel.fromJson(data);
                        return Row(
                          children: [
                            ProGap(x: UdDesign.pt(12)),
                            ProRadioButton(
                              checked: taskModel.status == "done",
                              size: UdDesign.pt(20),
                              onTap: (_) {
                                TaskController().updateStatus(
                                  document.id,
                                  taskModel.status!,
                                );
                              },
                            ),
                            ProGap(x: UdDesign.pt(12)),
                            Expanded(
                              child: ProTapper(
                                padding: const EdgeInsets.all(0),
                                onTap: () {
                                  proBottomSheet(
                                    context: context,
                                    appBarTitle: "Task Details",
                                    sheetBody: TaskDetailBottomSheet(
                                      taskModel: taskModel,
                                      docID: document.id,
                                    ),
                                    isScrollControlled: true,
                                    sheetHeight: UdDesign.blocksYaxis(80),
                                  );
                                },
                                child: TaskCard(
                                  taskModel: taskModel,
                                  docID: document.id,
                                ),
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    );
                  },
                )
              : taskController.shiftDataState == DataState.empty
                  ? Center(
                      child: ProText(
                        text: 'No task available in current shift.',
                        fontSize: UdDesign.fontSize(14),
                        color: ProjectColors.navyDeep,
                      ),
                    )
                  : taskController.shiftDataState == DataState.error
                      ? Center(
                          child: ProText(
                            text: ProjectStrings.wentWrong,
                            fontSize: UdDesign.fontSize(14),
                            color: ProjectColors.navyDeep,
                          ),
                        )
                      : const ProLoader(),
        )
      ],
    );
  }
}
