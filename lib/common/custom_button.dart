import 'package:enif/common/stringHelper.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {
  double? buttonWidth;
  void Function()? onTap;
  double? buttonHeight;
  Color buttonColor;
  Color? textColor;
  double? horizontal;
  Widget? title;

  CustomButton(
      {Key? key,
      this.horizontal,
      this.buttonHeight = 35,
      this.buttonWidth,
      this.title,
      this.textColor = ColorConstant.whiteColor,
      required this.onTap,
      // required this.text,
      this.buttonColor = ColorConstant.blackColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: buttonHeight ? width : buttonWidth?.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: title ??
              Text(
                StringHelper.send,
                // text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  // fontFamily: FontFamilyConstants.markPro,
                ),
              ),
        ),
      ),
    );
  }
}
