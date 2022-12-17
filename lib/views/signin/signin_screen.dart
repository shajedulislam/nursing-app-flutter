import 'package:flutter/material.dart';
import 'package:nursingapp/utilities/constants/colors.dart';
import 'package:nursingapp/utilities/functions/gesture.dart';
import 'package:nursingapp/utilities/functions/middlewears.dart';
import 'package:nursingapp/views/signin/components/form_fields.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:ud_design/ud_design.dart';

class SigninScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocus(context),
      child: Scaffold(
        backgroundColor: ProjectColors.background,
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: UdDesign.pt(32),
            horizontal: UdDesign.pt(16),
          ),
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProText(
                    text: "Sign\nin.",
                    fontSize: 30,
                  ),
                  ProGap(
                    y: UdDesign.pt(32),
                  ),
                  Column(
                    children: [
                      SigninFormFields(formKey: _formKey),
                      const ProGap(y: 24),
                      ProButtonBasic(
                        width: double.infinity,
                        height: UdDesign.pt(50),
                        borderRadius: UdDesign.pt(4),
                        text: "Sign in",
                        fontSize: UdDesign.fontSize(16),
                        backgroundColor: ProjectColors.blueDeep,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            signinMiddleWear();
                          }
                        },
                      ),
                      // const ProGap(y: 16),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     ProText(
                      //       text: "Don't have any account?",
                      //       fontSize: UdDesign.fontSize(14),
                      //       color: ProjectColors.textDeep,
                      //     ),
                      //     ProGap(x: UdDesign.pt(4)),
                      //     ProTapper(
                      //       child: ProText(
                      //         text: "Sign up",
                      //         fontSize: UdDesign.fontSize(14),
                      //         color: ProjectColors.blueDeep,
                      //       ),
                      //       onTap: () {},
                      //     )
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
