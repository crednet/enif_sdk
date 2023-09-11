import 'package:enif/constants/svg_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class EnifAppbar extends PreferredSize {
  EnifAppbar({super.key, required Function() navigateToChatHistoryScreen})
      : super(
            preferredSize: const Size.fromHeight(70),
            child: SafeArea(
              child: Row(
                children: [
                  SvgPicture.asset(SvgAssets.logoFull, package: 'enif'),

                  CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      onPressed: navigateToChatHistoryScreen,
                      child: Stack(
                        children: [
                          SvgPicture.asset(SvgAssets.chatUser1,
                              package: 'enif'),
                          SvgPicture.asset(SvgAssets.chatUser1,
                              package: 'enif'),
                          SvgPicture.asset(SvgAssets.chatUser1,
                              package: 'enif'),
                        ],
                      )),

                  //IconButton

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      package: 'enif',
                      scale: 4,
                    ),
                  ),
                ],
              ),
            ));
}
