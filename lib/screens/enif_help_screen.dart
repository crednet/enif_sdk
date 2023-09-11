import 'package:enif/common/extensions.dart';
import 'package:enif/custom/custom_textfield.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/faq/views/faq_list.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/custom_appbar.dart';
import '../common/image_helper.dart';
import '../common/stringHelper.dart';
import '../common/text_style_common.dart';

class EnifHelpScreen extends StatefulWidget {
  const EnifHelpScreen({Key? key}) : super(key: key);

  @override
  State<EnifHelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<EnifHelpScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          backgroundColor: Colors.blueAccent,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(ImageHelper.arrowRightImg,
                      package: 'enif', scale: 4)
                  .addPadding(const EdgeInsets.only(left: 10))),
          text: StringHelper.help,
          textColor: ColorConstant.whiteColor,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.h,
                  CustomTextField(
                      fillColor: ColorConstant.whiteColor,
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          ImageHelper.searchImg,
                          package: 'enif',
                          scale: 4,
                        ),
                      ),
                      controller: controller,
                      labelText: StringHelper.searchHelp),
                  15.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${(0)} collections",
                          style: AppTextStyle.heading14Style()),
                      const Spacer(),
                      Image.asset(ImageHelper.arrowImg,
                          package: 'enif', scale: 2.5),
                    ],
                  ).addPadding(const EdgeInsets.symmetric(horizontal: 8)),
                  const Divider(
                    thickness: .5,
                  ).addPadding(const EdgeInsets.symmetric(horizontal: 10)),
                  10.h,
                  Center(
                      child: Image.asset(ImageHelper.arrowImg,
                          package: 'enif', scale: 2.5)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      20.h,
                      Text("About CredPal",
                          style: AppTextStyle.heading14Style()),
                      8.h,
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text("3 Articles",
                            style: AppTextStyle.heading12Style()),
                      ),
                      const Divider(
                        thickness: .5,
                      ).addPadding(const EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                  const FaqList(mini: false)
                ])));
  }
}
