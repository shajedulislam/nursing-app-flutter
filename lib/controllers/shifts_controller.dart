import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utilities/enums/data_state.dart';

class MyShiftController with ChangeNotifier {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  DataState shiftDataState = DataState.initial;
  List myShifts = [];
  String collection = "shifts";

  Future reset() async {
    shiftDataState = DataState.empty;
    myShifts = [];
  }

  getMyShifts(String user) {
    fireStore.collection(collection).doc(user).get().then((document) {
      if (document.data() != null) {
        if (document.get("shift_list") != null) {
          myShifts = document.get("shift_list");
          shiftDataState = DataState.loaded;
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
  }
}
