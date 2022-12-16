import 'package:flutter/material.dart';
import 'package:pro_widgets/pro_widgets.dart';
import 'package:ud_design/ud_design.dart';

/// To show some information in an alert you can use this function. It can not be used for Widget type return. For that you can use [ UdAlertWidget ]
Future<void> proAlertFunction({
  required BuildContext context,
  final double? width,
  final String? title,
  final double? titleFontSize,
  final String? message,
  final double? messageFontSize,
  final String? button1Text,
  final double? button1FontSize,
  final Function? button1Function,
  final String? button2Text,
  final double? button2FontSize,
  final Function? button2Function,
  final double? alertBorderRadius,
  final bool? closeAlertOnTapArround,
  final Color? colorAroundTheAlert,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: closeAlertOnTapArround ?? true,
    barrierColor: colorAroundTheAlert,
    builder: (BuildContext context2) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(alertBorderRadius ?? UdDesign.pt(4)),
          ),
        ),

        // title: ProText(
        //   text: title ?? "Title",
        //   alignment: TextAlign.center,
        //   color: Colors.black.withOpacity(0.7),
        //   fontSize: titleFontSize ?? UdDesign.fontSize(18),
        //   fontWeight: FontWeight.w600,
        // ),
        content: Container(
          width: width ?? UdDesign.blocksXaxis(70),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(alertBorderRadius ?? UdDesign.pt(4)),
            bottomRight: Radius.circular(alertBorderRadius ?? UdDesign.pt(4)),
          )),
          child: ListView(
            padding: const EdgeInsets.all(0),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              // ProSvgImage(
              //   height: 30,
              //   width: 30,
              //   imagePath: ProjectPaths.icAlertSuccess,
              // ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(UdDesign.pt(16)),
                child: ProText(
                  text: message ?? "Write your dialog messgae!",
                  color: Colors.black.withOpacity(0.7),
                  fontSize: messageFontSize ?? UdDesign.fontSize(16),
                  alignment: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UdDesign.pt(16),
                  vertical: UdDesign.pt(4),
                ),
                child: Row(
                  mainAxisAlignment: button2Text != null
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: button1Function as void Function()?,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: UdDesign.pt(10)),
                        height: UdDesign.pt(30),
                        alignment: Alignment.center,
                        child: ProText(
                          text: button1Text ?? "button 1",
                          color: Colors.black.withOpacity(0.7),
                          fontSize: button1FontSize ?? UdDesign.fontSize(16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    button2Text != null
                        ? InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: button2Function as void Function()?,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: UdDesign.pt(10)),
                              height: UdDesign.pt(30),
                              alignment: Alignment.center,
                              child: ProText(
                                text: button2Text,
                                color: Colors.black.withOpacity(0.7),
                                fontSize:
                                    button2FontSize ?? UdDesign.fontSize(16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
