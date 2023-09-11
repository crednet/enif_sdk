import 'package:enif/common/colors.dart';
import 'package:enif/common/extensions.dart';
import 'package:enif/common/image_helper.dart';
import 'package:enif/common/stringHelper.dart';
import 'package:enif/common/text_style_common.dart';
import 'package:enif/custom/custom_textfield.dart';
import 'package:enif/enif.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/modules/common/enif_appbar.dart';
import 'package:enif/modules/faq/views/faq_list.dart';
import 'package:enif/prefrences/app_prefreces.dart';
import 'package:enif/screens/chat_history_screen.dart';
import 'package:enif/screens/enif_help_screen.dart';
import 'package:enif/screens/live_chat_first_screen.dart';
import 'package:enif/screens/live_chat_screen.dart';
import 'package:flutter/material.dart';

class EnifHome extends StatefulWidget {
  const EnifHome({Key? key}) : super(key: key);

  @override
  State<EnifHome> createState() => _homeScreenState();
}

class _homeScreenState extends State<EnifHome> {
  @override
  void initState() {
    AppPreferences.getInstance().then((value) => appPreferences = value);
    super.initState();
    // BlocProvider.of<GetFaqBloc>(context).add(GetFaqRefreshEvent());
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        appBar: EnifAppbar(navigateToChatHistoryScreen: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChatHistoryScreen()));
        }),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.h,
              Row(
                children: [
                  Text(
                    "Hello Olorunfemi",
                    style: AppTextStyle.appBarStyle(),
                  ),
                  Image.asset(
                    "assets/images/hand.png",
                    package: 'enif',
                    height: 40,
                  )
                ],
              ),
              Text(StringHelper.howCan, style: AppTextStyle.TextSize32()),
              Text(StringHelper.weHelp, style: AppTextStyle.TextSize32()),
              15.h,
              InkWell(
                onTap: () {
                  if ((appPreferences
                                  ?.getString(appPreferences?.chatId ?? "")
                                  ?.isEmpty ==
                              true &&
                          appPreferences
                                  ?.getString(appPreferences?.email ?? "")
                                  ?.isEmpty ==
                              true) ||
                      (appPreferences
                                  ?.getString(appPreferences?.chatId ?? "") ==
                              null &&
                          appPreferences
                                  ?.getString(appPreferences?.email ?? "") ==
                              null)) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LiveChatScreen(),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveChatFirstScreen(
                            chatId: appPreferences
                                ?.getString(appPreferences?.chatId ?? ""),
                            customer: appPreferences
                                ?.getString(appPreferences?.name ?? ""),
                            channel: appPreferences
                                ?.getString(appPreferences?.channel ?? ""),
                          ),
                        ));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.blueAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Live Chat",
                            style: AppTextStyle.homeStyle(),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "We typically reply in few minutes...",
                            style: AppTextStyle.homeStyle1(),
                          ),
                        ],
                      ).addPadding(
                          EdgeInsets.symmetric(vertical: 5, horizontal: 8)),
                      // Icon(Icons.add),
                      Image.asset(
                        "assets/images/messanger.png",
                        package: 'enif',
                        height: 20,
                      ).addPadding(
                          EdgeInsets.symmetric(vertical: 5, horizontal: 8))
                    ],
                  ),
                ),
              ),
              30.h,
              CustomTextField(
                fillColor: ColorConstant.whiteColor,
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    ImageHelper.searchImg,
                    package: 'enif',
                    scale: 3.5,
                  ),
                ),
                controller: controller,
                labelText: StringHelper.searchHelp,
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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnifHelpScreen(),
                      ));
                },
                child: Container(
                  height: 42,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFE6E3EE)),
                  child: Center(
                      child: Text(
                    "Go to all articles",
                    style: AppTextStyle.appBarStyle12(),
                  )),
                ),
              ),
            ],
          ),
        )));
  }
}
