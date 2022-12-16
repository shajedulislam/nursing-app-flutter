import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

Future<bool> isNetworkAvailable() async {
  final Connectivity connectivity = Connectivity();
  ConnectivityResult result = ConnectivityResult.none;
  try {
    result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet) {
      return true;
    } else {
      return false;
    }
  } on PlatformException catch (_) {
    return false;
  }
}
