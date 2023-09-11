import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/colors.dart';


class CustomTextFields extends StatelessWidget {
  TextInputType? keyboardType;
  String labelText;
  String? headingText;
  Color? fillColor;
  Widget? prefix;
  Widget? suffix;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  double? contentPadding;
  void Function()? onTap;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();
  void Function(String?)? onSaved;
  void Function(String?)? onChange;
  CustomTextFields(
      {this.obscureText,
        this.textCapitalization,
        this.validator,
        this.prefix,
        this.suffix,
        this.onTap,
        this.inputFormatters,
        this.fillColor,
        required this.controller,
        required this.labelText,
        this.onSaved,
        this.onChange,
        this.headingText,
        this.keyboardType = TextInputType.multiline,
        this.contentPadding,
        this.maxLines,
        this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            textInputAction: TextInputAction.newline,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            cursorColor: ColorConstant.blackColor,
            cursorWidth: 1,
            validator: validator,
            onChanged: onChange,
            obscureText: obscureText ?? false,
            maxLines: maxLines,
            keyboardType: keyboardType,
            controller: controller,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            onSaved: onSaved,
            style: const TextStyle(
              color: Colors.black,
              // fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              counterText: "",
              alignLabelWithHint: true,
              prefix: prefix,
              suffixIcon: suffix,
              fillColor: fillColor,
              filled: true,
              hintText: labelText,
              //labelStyle: AppTextStyle.size14gw500,
                hintStyle: const TextStyle(
                  color: ColorConstant.lightGrayColor
                ),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: contentPadding??10, horizontal: contentPadding??24),
              enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorConstant.transparent),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorConstant.transparent),
                borderRadius: BorderRadius.circular(50),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorConstant.transparent),
                borderRadius: BorderRadius.circular(50),
              ),
              disabledBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(50),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorConstant.transparent),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}