import 'package:flutter/material.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';

import '../../../../utilities/functions/null_check.dart';
import '../../../controllers/signin_controller.dart';

class SigninFormFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SigninFormFields({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ProTextFormField(
            label: "Email",
            labelFontSize: UdDesign.fontSize(14),
            labelFontColor: ProjectColors.textDeep,
            paddingVertical: UdDesign.pt(17),
            hint: "Enter your email",
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
                context.read<SigninController>().email = value;
              }
              return null;
            },
          ),
          const ProGap(y: 16),
          ProTextFormField(
            label: "Password",
            labelFontSize: UdDesign.fontSize(14),
            labelFontColor: ProjectColors.textDeep,
            paddingVertical: UdDesign.pt(17),
            hint: "Enter your password",
            hintFontSize: UdDesign.fontSize(14),
            hintColor: ProjectColors.textLight,
            borderRadius: UdDesign.pt(4),
            borderColor: ProjectColors.border,
            fontSize: UdDesign.fontSize(14),
            fontColor: ProjectColors.textDeep,
            obsecureText: true,
            textInputAction: TextInputAction.done,
            errorFontSize: UdDesign.fontSize(12),
            validator: (value) {
              if (isNull(value)) {
                return 'Password can not be empty';
              } else {
                context.read<SigninController>().password = value;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
