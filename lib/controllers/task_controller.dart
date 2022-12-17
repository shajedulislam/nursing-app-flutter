import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nursingapp/models/shift_model.dart';
import 'package:nursingapp/models/task_model.dart';
import 'package:nursingapp/utilities/constants/strings.dart';
import 'package:nursingapp/utilities/enums/data_state.dart';
import 'package:nursingapp/utilities/functions/generate_shift_type.dart';
import 'package:nursingapp/utilities/functions/show_snackbar.dart';

class TaskController with ChangeNotifier {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String collectionTask = "tasks";
  String collectionShift = "shifts";
  DataState shiftDataState = DataState.initial;
  ShiftModel? shiftModel = ShiftModel();
  late QuerySnapshot shiftStream;
  TaskModel taskCreateModel = TaskModel();

  Future resetCreateTask() async {
    taskCreateModel = TaskModel();
  }

  notify() {
    notifyListeners();
  }

  createTask() async {
    taskCreateModel.status = "pending";
    fireStore
        .collection(collectionTask)
        .add(taskCreateModel.toJson())
        .catchError((_) {
      showSnackbar(text: ProjectStrings.wentWrong);
    });
  }

  moveTask({
    required String docID,
    required String date,
    required String shift,
  }) async {
    fireStore.collection(collectionTask).doc(docID).update({
      "date": date,
      "shift": shift,
    }).catchError((_) {
      showSnackbar(text: ProjectStrings.wentWrong);
    });
  }

  getShifts(String user) {
    shiftDataState = DataState.loading;
    generateShiftType().then((genShift) {
      if (genShift != null) {
        FirebaseFirestore.instance
            .collection(collectionShift)
            .doc(user)
            .get()
            .then((document) {
          if (document.data() != null) {
            List? shiftList = document.get("shift_list");
            if (shiftList != null && shiftList.isNotEmpty) {
              bool found = false;
              for (Map<String, dynamic> shift in shiftList) {
                if (genShift == "night" &&
                    TimeOfDay.now().hour > 0 &&
                    TimeOfDay.now().hour <= 6) {
                  if (shift['date'] ==
                          DateFormat("yyyy-MM-dd").format(DateTime.now()
                              .subtract(const Duration(days: 1))) &&
                      shift['shift_type'] == genShift) {
                    shiftModel = ShiftModel.fromJson(shift);
                    found = true;
                    break;
                  }
                } else {
                  if (shift['date'] ==
                          DateFormat("yyyy-MM-dd").format(DateTime.now()) &&
                      shift['shift_type'] == genShift) {
                    shiftModel = ShiftModel.fromJson(shift);
                    found = true;
                    break;
                  }
                }
              }
              if (found == true) {
                shiftDataState = DataState.loaded;
              } else {
                shiftDataState = DataState.empty;
              }
            } else {
              shiftDataState = DataState.empty;
            }
          } else {
            shiftDataState = DataState.empty;
          }
          notifyListeners();
        }).catchError((_) {
          shiftDataState = DataState.error;
          notifyListeners();
        });
      } else {
        shiftDataState = DataState.error;
        notifyListeners();
      }
    });
  }

  getTodoList(ShiftModel shift) {
    return fireStore
        .collection(collectionTask)
        .where("date", isEqualTo: shift.date)
        .where("shift", isEqualTo: shift.shiftType)
        .snapshots();
  }

  updateStatus(String docID, String status) {
    fireStore.collection(collectionTask).doc(docID).update({
      "status": status == "pending" ? "done" : "pending",
    }).catchError((_) {
      showSnackbar(
          text:
              "Something went wrong while updating status. Please try again.");
    });
  }
}
