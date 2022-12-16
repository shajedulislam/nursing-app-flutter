import 'package:nursingapp/utilities/global_objects.dart';
import 'package:nursingapp/views/root.dart';

import '../../services/shared_preference.dart';
import '../../views/signin/loader/signin_loader.dart';
import '../../views/signin/signin_screen.dart';
import '../constants/keys.dart';
import '../constants/strings.dart';
import 'navigation.dart';
import 'network_check.dart';
import 'show_snackbar.dart';

Future<void> signinMiddleWear() async {
  bool networkAvailable = false;

  //Network Check
  networkAvailable = await isNetworkAvailable();
  if (networkAvailable == true) {
    loader(screen: const SigninLoader());
  } else {
    showSnackbar(text: ProjectStrings.checkInternet);
  }
}

rootMiddleWear() async {
  bool networkAvailable = false;

  //Network Check
  networkAvailable = await isNetworkAvailable();
  if (networkAvailable == true) {
    //Is logged in check
    localtor<SharedPreferenceServices>()
        .getBool(key: ProjectKeys.isLoggedIn)
        .then((value) async {
      if (value != null && value == true) {
        pushRemoveAll(screen: const Root());
      } else {
        pushRemoveAll(screen: SigninScreen());
      }
    });
  } else {
    showSnackbar(text: ProjectStrings.checkInternet);
  }
}
