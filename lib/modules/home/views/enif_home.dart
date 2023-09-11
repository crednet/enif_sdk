import 'package:enif/common/stringHelper.dart';
import 'package:enif/common/text_style_common.dart';
import 'package:enif/constants/image_assets.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:enif/enif.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/common/enif_appbar.dart';
import 'package:enif/modules/faq/views/enif_help_screen.dart';
import 'package:enif/modules/faq/views/faq_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/live_chat_button.dart';

class EnifHome extends StatelessWidget {
  final bool showBackButton;
  const EnifHome({Key? key, this.showBackButton = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        appBar: EnifAppbar(
            context: context,
            showBackButton: showBackButton,
            navigateToChatHistoryScreen: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const ChatHistoryScreen()));
            }),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.h,
              Row(children: [
                ValueListenableBuilder(
                  valueListenable: EnifController().userParams,
                  builder: (c, value, child) => Text(
                      "Hello ${value?.firstName ?? ''}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.textColor)),
                ),
                Image.asset(ImageAssets.hand, package: 'enif', height: 40)
                    .animate()
                    .shake(delay: 600.ms)
              ]),
              5.0.h,
              Text(StringHelper.howCan, style: AppTextStyle.largeText(context)),
              Text(StringHelper.weHelp, style: AppTextStyle.largeText(context)),
              48.h, const LiveChatButton(),
              60.h,
              Material(
                clipBehavior: Clip.antiAlias,
                type: MaterialType.transparency,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                  side: BorderSide(color: context.textColor, width: .5),
                ),
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnifHelpScreen(),
                        ));
                  },
                  child: Row(
                    children: [
                      Text('Search for help',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: context.textColor)),
                      0.s,
                      SizedBox.square(
                        dimension: 18,
                        child: SvgPicture.asset(
                          SvgAssets.search,
                          fit: BoxFit.contain,
                          package: 'enif',
                          colorFilter: ColorFilter.mode(
                              context.textColor, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              20.h,
              const FaqList(mini: true),
              // BlocBuilder<GetFaqBloc, GetFaqState>(builder: (context, state) {
              //   if (state is GetFaqLoadingState) {
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (state is GetFaqSuccessState) {

              //   } else if (state is GetFaqErrorState) {
              //     return Center(child: Text(state.errorMessage));
              //   } else {
              //     return SizedBox();
              //   }
              // }),
              40.h,
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnifHelpScreen(),
                      ));
                },
                padding: const EdgeInsets.all(13),
                borderRadius: BorderRadius.circular(20),
                color: context.isDark
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color(0xFFE7E6EB),
                child: Center(
                    child: Text("Go to all articles",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.textColor))),
              ),
              100.0.h,
            ],
          ),
        )));
  }
}
