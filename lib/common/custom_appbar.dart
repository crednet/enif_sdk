import 'package:enif/common/extensions.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  String? text;
  Widget? widget;
  Color? backgroundColor;
  Color? textColor;
  Widget? title;
  Widget? leading;
  void Function()? onTap;
  double? padding;
  FontWeight? fontWeight;
  CustomAppbar(
      {Key? key,
      this.onTap,
      this.padding,
      this.fontWeight,
      this.leading,
      this.textColor,
      this.text,
      this.widget,
      this.backgroundColor,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.white,
      leadingWidth: 45,
      centerTitle: true,
      leading: leading ??
          InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorConstant.lightDark)),
                child: const Icon(Icons.arrow_back,
                    color: ColorConstant.blackColor, size: 17)),
          ).addPadding(const EdgeInsets.only(left: 10)),
      title: title ??
          Text(
            text ?? "",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                color: textColor ?? Colors.black,
                fontWeight: fontWeight ?? FontWeight.w400,
              ),
            ),
          ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: ColorConstant.whiteColor,
                size: 20,
              ),
            ).addPadding(const EdgeInsets.only(left: 10)),
          ),
        ),
       10.w,
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
