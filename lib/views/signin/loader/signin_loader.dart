import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/signin_controller.dart';
import '../../../../utilities/constants/colors.dart';
import '../../../../utilities/functions/navigation.dart';
import '../../../../utilities/widgets/loader.dart';
import '../../../utilities/constants/strings.dart';
import '../../../utilities/enums/data_state.dart';
import '../../../utilities/widgets/alert.dart';

class SigninLoader extends StatefulWidget {
  const SigninLoader({Key? key}) : super(key: key);

  @override
  State<SigninLoader> createState() => _SigninLoaderState();
}

class _SigninLoaderState extends State<SigninLoader> {
  @override
  void initState() {
    context.read<SigninController>().reset().then((_) {
      context.read<SigninController>().signin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var signinController = context.watch<SigninController>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ProjectColors.loader,
        body: signinController.dataState == DataState.error
            ? ProAlert(
                width: 300,
                title: "Oops!",
                titleFontSize: 16,
                message: signinController.errorModel?.message,
                messageFontSize: 14,
                button1Text: "Ok",
                button1FontSize: 16,
                button1Function: () {
                  pop();
                },
              )
            : signinController.dataState == DataState.empty
                ? ProAlert(
                    width: 300,
                    title: "Oops!",
                    message: ProjectStrings.userNotFound,
                    messageFontSize: 14,
                    titleFontSize: 16,
                    button1Text: "Ok",
                    button1FontSize: 16,
                    button1Function: () {
                      pop();
                    },
                  )
                : const ProLoader(
                    color: ProjectColors.white,
                  ),
      ),
    );
  }
}
