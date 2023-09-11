import 'package:enif/common/text_style_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/colors.dart';

class CustomTextField extends StatelessWidget {
  TextInputType? keyboardType;
  String labelText;
  String? headingText;
  Color? fillColor;
  Widget? prefix;
  Widget? suffix;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  void Function()? onTap;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();
  void Function(String?)? onSaved;
  void Function(String?)? onChange;
  CustomTextField(
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
            style: AppTextStyle.appBarStyle12(),
            decoration: InputDecoration(
              counterText: "",
              alignLabelWithHint: true,
              prefix: prefix,
              suffixIcon: suffix,
              fillColor: fillColor,
              filled: true,
              hintText: labelText,
              //labelStyle: AppTextStyle.size14gw500,
              hintStyle: AppTextStyle.heading12Style(),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConstant.blackColor),
                borderRadius: BorderRadius.circular(35),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConstant.blackColor),
                borderRadius: BorderRadius.circular(35),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConstant.blackColor),
                borderRadius: BorderRadius.circular(35),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConstant.blackColor),
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
