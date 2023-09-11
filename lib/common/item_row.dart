import 'package:enif/common/extensions.dart';
import 'package:enif/common/image_helper.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';


class ItemRow extends StatelessWidget {
  Widget? leading;
  Widget? subLeading;
  Function()? onTap;
  String? title;
  String? subtitle;
  double? leadingWidth;
  ItemRow(
      {Key? key,
      this.title,
      this.leading,
      this.subtitle,
      this.leadingWidth,
      this.onTap,
      this.subLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading ?? const SizedBox(),
            8.h,
            subLeading ?? const SizedBox(),
          ],
        ),
        const Spacer(),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: InkWell(
              onTap: () {},
              child: Image.asset(ImageHelper.arrowImg, package: 'enif', scale: 2.5)),
        )),
        const Divider(),
      ],
    ).addPadding(const EdgeInsets.symmetric(horizontal: 10));
  }
}
