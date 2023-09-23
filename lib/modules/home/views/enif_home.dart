import 'package:enif/constants/image_assets.dart';
import 'package:enif/constants/svg_assets.dart';
import 'package:enif/enif.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/chat/views/chat_history_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class EnifHome extends StatelessWidget {
  final bool showBackButton;
  const EnifHome({Key? key, this.showBackButton = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.backgroundColor,
      child: Scaffold(
          backgroundColor: context.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.backgroundColor,
            elevation: 0,
            leadingWidth: 130,
            leading: Row(
              children: [
                if (showBackButton)
                  const Back()
                      .animate()
                      .fadeIn(delay: 100.ms)
                      .shimmer(delay: 400.ms)
                else
                  12.0.w,
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
                )).animate().fadeIn(delay: 100.ms).shimmer(delay: 400.ms)
              ],
            ),
            actions: [
              CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatHistoryView(),
                        ));
                  },
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
            ],
          ),
          // appBarx: EnifAppbar(
          //     context: context,
          //     showBackButton: showBackButton,
          //     navigateToChatHistoryScreen: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ChatHistoryView(),
          //     )).then((value) {
          //   // SystemChrome.setSystemUIOverlayStyle(context.isDark
          //   //     ? SystemUiOverlayStyle.light
          //   //     : SystemUiOverlayStyle.dark);
          // });
          //     }),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OverlaySettings(),
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
                Text('How can\nwe help ?',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: context.textColor)),
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
                          )).then((value) {
                        // SystemChrome.setSystemUIOverlayStyle(context.isDark
                        //     ? SystemUiOverlayStyle.light
                        //     : SystemUiOverlayStyle.dark);
                      });
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
                        )).then((value) {
                      // SystemChrome.setSystemUIOverlayStyle(context.isDark
                      //     ? SystemUiOverlayStyle.light
                      //     : SystemUiOverlayStyle.dark);
                    });
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
          ))),
    );
  }
}

class OverlaySettings extends StatefulWidget {
  const OverlaySettings({super.key});

  @override
  State<OverlaySettings> createState() => _OverlaySettingsState();
}

class _OverlaySettingsState extends State<OverlaySettings> {
  @override
  void didChangeDependencies() {
    // SystemChrome.setSystemUIOverlayStyle(context.isDark
    //     ? SystemUiOverlayStyle.light
    //     : SystemUiOverlayStyle.dark);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
