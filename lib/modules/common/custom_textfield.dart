import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String labelText;
  final String? headingText;
  final Color? fillColor;
  final Widget? prefix;
  final Widget? suffix;
  final BorderSide? borderSide;
  final int? maxLines;
  final double borderWidth;
  final bool? enabled;
  final int? maxLength;
  final bool? obscureText;
  final Function()? onTap;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final AutovalidateMode? autovalidateMode;
  const CustomTextField(
      {super.key,
      this.enabled,
      this.obscureText,
      this.textCapitalization,
      this.validator,
      this.prefix,
      this.suffix,
      this.onTap,
      this.inputFormatters,
      this.fillColor,
      this.controller,
      required this.labelText,
      this.onSaved,
      this.onChanged,
      this.headingText,
      this.keyboardType = TextInputType.multiline,
      this.maxLines,
      this.maxLength,
      this.borderWidth = .5,
      this.borderSide,
      this.autovalidateMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
                textInputAction: TextInputAction.newline,
                inputFormatters: inputFormatters,
                maxLength: maxLength,
                cursorColor: context.textColor,
                cursorWidth: 1,
                validator: validator,
                enabled: enabled,
                onChanged: onChanged,
                obscureText: obscureText ?? false,
                maxLines: maxLines,
                keyboardType: keyboardType,
                controller: controller,
                autovalidateMode: autovalidateMode,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                onSaved: onSaved,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: context.textColor),
                decoration: InputDecoration(
                    counterText: "",
                    alignLabelWithHint: true,
                    prefix: prefix,
                    suffixIcon: suffix,
                    fillColor: fillColor,
                    filled: true,
                    hintText: labelText,
                    //labelStyle: AppTextStyle.size14gw500,
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: context.textColor),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    enabledBorder: OutlineInputBorder(
                      borderSide: borderSide ??
                          BorderSide(
                              width: borderWidth, color: context.textColor),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: borderWidth, color: context.textColor),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: borderWidth, color: context.textColor),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: borderWidth, color: context.textColor),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: borderWidth, color: context.textColor),
                        borderRadius: BorderRadius.circular(35))),
                onTap: onTap)),
      ],
    );
  }
}
