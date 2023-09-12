import 'package:enif/constants/image_assets.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/chat/view_model/chat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatInputWidget extends StatelessWidget {
  final ChatController controller;
  const ChatInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
    return Column(
      children: [
        Divider(
            height: 1,
            thickness: .5,
            color: context.isDark
                ? const Color.fromARGB(255, 138, 138, 139)
                : const Color(0xffA4A4A6)),
        TextField(
            onChanged: controller.textChanged,
            controller: controller.textEditingController,
            decoration: InputDecoration(
                hintText: 'Type a message',
                border: border,
                enabledBorder: border,
                errorBorder: border,
                focusedBorder: border,
                focusedErrorBorder: border)),
        Row(
          children: [
            10.0.w,
            CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                // color: context.isDark ? Colors.white : Colors.black,
                onPressed: () {},
                child: SizedBox.square(
                    dimension: 20,
                    child: Image.asset(ImageAssets.gif,
                        package: 'enif', color: context.textColor))),
            CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                // color: context.isDark ? Colors.white : Colors.black,
                onPressed: () {},
                child: SizedBox.square(
                  dimension: 20,
                  child: SvgPicture.asset(SvgAssets.imagePaceholder,
                      package: 'enif',
                      colorFilter: ColorFilter.mode(
                          context.textColor.withOpacity(.5), BlendMode.srcIn)),
                )),
            .0.s,
            ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      color: context.isDark ? Colors.white : Colors.black,
                      onPressed:
                          (value.text ?? '').isEmpty ? null : controller.send,
                      child: value.isLoading
                          ? const Center(
                              child: SizedBox.square(
                                  dimension: 18,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2)))
                          : Text('Send',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: context.isDark
                                      ? Colors.black
                                      : Colors.white)));
                }),
            20.0.w,
          ],
        ),
      ],
    );
  }
}
