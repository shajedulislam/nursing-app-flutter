import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nursingapp/models/error_model.dart';
import 'package:nursingapp/models/user_model.dart';
import 'package:nursingapp/services/shared_preference.dart';
import 'package:nursingapp/utilities/constants/strings.dart';
import 'package:nursingapp/utilities/functions/prints.dart';
import 'package:nursingapp/utilities/global_objects.dart';
import 'package:nursingapp/views/root.dart';

import '../utilities/constants/keys.dart';
import '../utilities/enums/data_state.dart';
import '../utilities/functions/navigation.dart';

class SigninController with ChangeNotifier {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String? email;
  String? password;
  DataState dataState = DataState.initial;
  ErrorModel? errorModel = ErrorModel();
  UserModel? userModel = UserModel();
  String collection = "users";

  Future<void> reset() async {
    dataState = DataState.initial;
    errorModel = ErrorModel();
    userModel = UserModel();
  }

  signin() {
    dataState = DataState.loading;
    fireStore
        .collection(collection)
        .where("email", isEqualTo: email)
        .get()
        .then((data) async {
      if (data.size > 0) {
        try {
          Map<String, dynamic> mapData = data.docs.first.data();
          printer("====RESPONSE====");
          printer(mapData);
          if (mapData['password'] == password) {
            userModel = UserModel.fromJson(mapData);
            await localtor<SharedPreferenceServices>().setString(
              key: ProjectKeys.userModel,
              value: json.encode(userModel),
            );
            await localtor<SharedPreferenceServices>().setBool(
              key: ProjectKeys.isLoggedIn,
              value: true,
            );
            dataState = DataState.loaded;
            pushRemoveAll(screen: const Root());
          } else {
            errorModel = ErrorModel(
              hasError: true,
              message: ProjectStrings.wrongPass,
            );
            dataState = DataState.error;
          }
        } catch (e) {
          errorModel = ErrorModel(
            hasError: true,
            message: ProjectStrings.wentWrong,
          );
          dataState = DataState.error;
        }
      } else {
        dataState = DataState.empty;
      }
      notifyListeners();
    }).catchError((error) {
      errorModel = ErrorModel(
        hasError: true,
        message: "${error ?? ProjectStrings.wentWrong}",
      );
      dataState = DataState.error;
      notifyListeners();
    });
  }

  Future getUserModelFromDevice() async {
    String? userModelString = await localtor<SharedPreferenceServices>()
        .getString(key: ProjectKeys.userModel);
    if (userModelString != null) {
      userModel = UserModel.fromJson(json.decode(userModelString));
    }
  }
}
