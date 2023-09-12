import 'package:enif/constants/image_assets.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import 'back.dart';
 

class EnifAppbar extends PreferredSize {
  EnifAppbar(
      {super.key,
      required bool showBackButton,
      required Function() navigateToChatHistoryScreen,
      required BuildContext context})
      : super(
            preferredSize: const Size.fromHeight(70),
            child: SafeArea(
              child: Row(
                children: [
                  if (!showBackButton) 20.0.w,
                  if (showBackButton)
                    const Back()
                        .animate()
                        .fadeIn(delay: 100.ms)
                        .shimmer(delay: 400.ms),

                  SizedBox.square(
                          dimension: 26,
                          child: Image.asset(ImageAssets.logo, package: 'enif'))
                      .animate()
                      .fadeIn(delay: 100.ms)
                      .shimmer(delay: 400.ms),
                  5.5.w,
                 
                  SizedBox(
                      child: SvgPicture.asset(
                    SvgAssets.logoFull,
                    package: 'enif',
                    colorFilter:
                        ColorFilter.mode(context.textColor, BlendMode.srcIn),
                  )).animate().fadeIn(delay: 100.ms).shimmer(delay: 400.ms),
                  0.s,

                  CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      onPressed: navigateToChatHistoryScreen,
                      child: SizedBox(
                        height: 47,
                        width: 150,
                        child: Stack(
                          children: [
                            Positioned(
                                    right: 60,
                                    bottom: 0,
                                    top: 0,
                                    child: Image.asset(ImageAssets.chatUser1,
                                        package: 'enif'))
                                .animate()
                                .fadeIn(delay: 400.ms)
                                .slideX(delay: 400.ms),
                            Positioned(
                                    right: 30,
                                    bottom: 0,
                                    top: 0,
                                    child: Image.asset(ImageAssets.chatUser2,
                                        package: 'enif'))
                                .animate()
                                .fadeIn(delay: 200.ms)
                                .slideX(delay: 200.ms),
                            Positioned(
                                    right: 0,
                                    bottom: 0,
                                    top: 0,
                                    child: Image.asset(ImageAssets.chatUser3,
                                        package: 'enif'))
                                .animate()
                                .fadeIn()
                                .slideX()
                          ],
                        ),
                      )),

                  20.0.w,
                  //IconButton
                ],
              ),
            )) {
    SystemChrome.setSystemUIOverlayStyle(context.isDark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark);
  }
}
