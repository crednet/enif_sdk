import 'package:enif/common/colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_faamily.dart';

class AppTextStyle {
  static TextStyle appBarStyle() {
    return TextStyle(
        fontSize: 14,
        fontFamily: FontFamilyConstants.axiformaRegular,
        fontWeight: FontWeight.w300,
        color: ColorConstant.blackColor);
  }

  static TextStyle appBarStyle12() {
    return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamilyConstants.axiformaRegular,
        color: ColorConstant.blackColor);
  }

  static TextStyle homeStyle() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamilyConstants.axiformaRegular,
        color: ColorConstant.whiteColor);
  }

  static TextStyle homeStyle1() {
    return TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
        fontFamily: FontFamilyConstants.axiformaRegular,
        color: ColorConstant.whiteColor);
  }

  static TextStyle appBarStyle1() {
    return TextStyle(
      fontSize: 20,
      fontFamily: FontFamilyConstants.axiformaBold,
    );
  }

  static TextStyle appBarStyle2() {
    return TextStyle(
      fontSize: 20,
      color: ColorConstant.blackColor,
      fontFamily: FontFamilyConstants.axiformaBold,
    );
  }

  static TextStyle appBar13Style() {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamilyConstants.axiformaBold,
    );
  }

  static TextStyle Text13Style() {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      fontFamily: FontFamilyConstants.axiformaRegular,
    );
  }

  static TextStyle Text13Styles() {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: ColorConstant.whiteColor,
      fontFamily: FontFamilyConstants.axiformaRegular,
    );
  }

  static TextStyle TextSize() {
    return TextStyle(
      fontSize: 17,
      fontFamily: FontFamilyConstants.axiformaHeavyitalic,
    );
  }

  static TextStyle largeText(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: context.textColor,
      fontFamily: FontFamilyConstants.axiformaBold,
    );
  }

  static TextStyle heading14Style() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorConstant.blackColor,
      fontFamily: FontFamilyConstants.axiformaRegular,
    );
  }

  static TextStyle heading12Style() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorConstant.black1Color,
      fontFamily: FontFamilyConstants.axiformaRegular,
    );
  }

  static TextStyle heading12Styles() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorConstant.black1Color,
      fontFamily: FontFamilyConstants.axiformaBold,
    );
  }

  static TextStyle heading112Style() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ColorConstant.blackColor,
      fontFamily: FontFamilyConstants.axiformaRegular,
    );
  }

  static TextStyle heading10Style() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: ColorConstant.nameColor,
      fontFamily: FontFamilyConstants.axiformaRegular,
    );
  }

  // static TextStyle markProHeavy(fs, fw, color) {
  //   return TextStyle(
  //       fontFamily: FontFamilyConstants.markProHeavy,
  //       color: color,
  //       fontWeight: fw,
  //       fontSize: fs);
  // }
  //
  // static TextStyle markPro(fs, fw, color) {
  //   return TextStyle(
  //       fontFamily: FontFamilyConstants.markPro,
  //       color: color,
  //       fontWeight: fw,
  //       fontSize: fs);
  // }

  static TextStyle mont14Grey = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 14,
  );

  static TextStyle size12gw400 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle size10gw400 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static TextStyle size12gw500 = GoogleFonts.montserrat(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle size12bw400 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle size12bw500 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle size10bw600 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static TextStyle size10bw = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 10,
  );

  static TextStyle size12bw600 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  SizedBox addHeight(double size) => SizedBox(height: size);

  SizedBox addWidth(double size) => SizedBox(width: size);

  SizedBox addSize(double height, double width) =>
      SizedBox(width: width, height: height);
}
