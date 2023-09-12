import 'package:enif/constants/image_assets.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/chat_session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatInputWidget extends StatelessWidget {
  final ChatSession session;
  const ChatInputWidget({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Divider(
                height: 1,
                thickness: 1,
                color: context.isDark
                    ? const Color.fromARGB(255, 138, 138, 139)
                    : const Color(0xffA4A4A6)),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none))),
            Row(
              children: [
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
                              context.textColor.withOpacity(.5),
                              BlendMode.srcIn)),
                    )),
                .0.s,
                CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: context.isDark ? Colors.white : Colors.black,
                    onPressed: () {},
                    child: Text('Send',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color:
                                context.isDark ? Colors.black : Colors.white))),
              ],
            ),
          ],
        ));
  }
}
