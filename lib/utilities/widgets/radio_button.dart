import 'package:flutter/material.dart';
import 'package:pro_widgets/widgets/texts/text.dart';

import '../constants/colors.dart';

class ProRadioButton extends StatelessWidget {
  final double? size;
  final double? paddingVertical;

  /// It makes space inside when button is checked
  final double? innerMargin;
  final double? borderRadius;
  final String? title;
  final double? titleFontSize;
  final Color? titleColor;
  final FontWeight? titleWeight;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? skipTraversal;

  /// Pass a value to get it on tap and match for checking the radio button.
  final dynamic value;

  /// To check on the radio button pass true or false here.
  final bool? checked;

  /// Pass index number if you need it on tap using [ getIndex ] function
  ///
  /// The pupose of index number is to help you when there are for example multi-user based radio buttons and you need to know which one clicked. So, for this kind of index based situation you can use it if needed.
  ///
  /// Code Example :
  /// ```dart
  /// ProRadioButton(
  ///   title: "Male",
  ///   value: "male",
  ///   index: 1,
  ///   getIndex: (index) {
  ///     print(index);
  ///   },
  ///   onTap: (value) {
  ///     print(value);
  ///   },
  ///  )
  /// ```
  final int? index;

  /// Called when the user taps on the radio button and it returns the index value you passed in the widget.
  ///
  /// The pupose of this function is to help you when there are for example multi-user based radio buttons and you need to know which one clicked. So, for this kind of index based situation you can use it if needed.
  ///
  /// Code Example :
  /// ```dart
  /// WidgetRadioButton(
  ///   title: "Male",
  ///   value: "male",
  ///   index: 1,
  ///   getIndex: (index) {
  ///     print(index);
  ///   },
  ///   onTap: (value) {
  ///     print(value);
  ///   },
  ///  )
  /// ```
  final ValueChanged<int?>? getIndex;

  /// Called when the user taps on the radio button and it returns the value you passed in the widget.
  ///
  /// Code Example :
  /// ```dart
  /// WidgetRadioButton(
  ///   title: "Male",
  ///   value: "male",
  ///   index: 1,
  ///   getIndex: (index) {
  ///     print(index);
  ///   },
  ///   onTap: (value) {
  ///     print(value);
  ///   },
  ///  )
  /// ```
  final ValueChanged<dynamic>? onTap;

  /// You can modify this radio button passing values by your choice.
  const ProRadioButton(
      {super.key,
      this.size,
      this.paddingVertical,
      this.innerMargin,
      this.borderRadius,
      this.title,
      this.titleFontSize,
      this.titleColor,
      this.titleWeight,
      this.mainAxisAlignment,
      this.checked,
      this.value,
      this.index,
      this.onTap,
      this.getIndex,
      this.skipTraversal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: FocusNode(skipTraversal: skipTraversal ?? true),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        if (getIndex != null) {
          getIndex!(index);
        }
        if (onTap != null) {
          onTap!(value);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 8),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size ?? 16,
              width: size ?? 16,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ProjectColors.blueDeep.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadius != null
                        ? borderRadius!
                        : size != null
                            ? size! / 2
                            : 8,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(innerMargin ?? 2),
                decoration: BoxDecoration(
                  color: checked == true
                      ? ProjectColors.blueDeep
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      borderRadius != null
                          ? borderRadius!
                          : size != null
                              ? size! / 2
                              : 8,
                    ),
                  ),
                ),
              ),
            ),
            title != null
                ? Row(
                    children: [
                      const SizedBox(width: 6),
                      ProText(
                        text: title ?? "Radio Button",
                        fontSize: titleFontSize ?? 14,
                        fontWeight: titleWeight ?? FontWeight.w500,
                        color: titleColor ?? Colors.black,
                      )
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
