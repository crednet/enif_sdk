import 'package:enif/bloc/new_chat_bloc.dart';
import 'package:enif/common/extensions.dart';
import 'package:enif/common/text_style_common.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common/colors.dart';
import '../common/custom_appbar.dart';
import '../common/image_helper.dart';
import '../common/stringHelper.dart';
import '../custom/custom_textfiled1.dart';
import '../enif.dart';
import 'live_chat_first_screen.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({Key? key}) : super(key: key);

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        backgroundColor: Colors.blueAccent,
        onTap: () {},
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(ImageHelper.arrowRightImg,
                    package: 'enif', scale: 4)
                .addPadding(const EdgeInsets.only(left: 10))),
        text: StringHelper.enif,
        textColor: ColorConstant.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 480,
              child: Column(
                children: [
                  50.h,
                  Center(
                      child: Image.asset("assets/images/user.png",
                          package: 'enif', height: 45)),
                  Text(
                    "How can we be of help today...",
                    style: AppTextStyle.heading10Style(),
                  ),
                ],
              ),
            ),
            100.h,
            Container(
                color: ColorConstant.lightBlueColor,
                width: double.infinity,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      10.h,
                      Text(
                        "Tell us about you to start chatting",
                        style: AppTextStyle.heading112Style(),
                      ),
                      10.h,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            CustomTextFields(
                              fillColor: ColorConstant.whiteColor,
                              controller: nameController,
                              labelText: StringHelper.enterName,
                            ),
                            CustomTextFields(
                              fillColor: ColorConstant.whiteColor,
                              controller: emailController,
                              labelText: StringHelper.enterEmail,
                            ),
                            CustomTextFields(
                              keyboardType: TextInputType.number,
                              maxLength: 15,
                              fillColor: ColorConstant.whiteColor,
                              controller: phoneController,
                              labelText: StringHelper.enterPhone,
                            ),
                          ],
                        ),
                      ),
                      10.h,
                      const Divider(thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            15.h,
                            // CustomTextFields(
                            //   contentPadding: 0,
                            //   fillColor: ColorConstant.transparent,
                            //   controller: textController,
                            //   labelText: StringHelper.typeMessage,
                            // ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Aa"),
                                10.w,
                                Image.asset(ImageHelper.gifImg,
                                    package: 'enif', height: 14),
                                10.w,
                                Image.asset(ImageHelper.images,
                                    package: 'enif', height: 14),
                                100.h,
                                BlocListener<NewChatBloc, NewChatState>(
                                  listener: (context, state) {
                                    if (state is NewChatLoadingState) {
                                      EasyLoading.show();
                                    } else if (state is NewChatSuccessState) {
                                      EasyLoading.dismiss();
                                      appPreferences?.setString(
                                          state.data.chatId ?? "",
                                          appPreferences?.chatId ?? "");
                                      appPreferences?.setString(
                                          state.data.channel ?? "",
                                          appPreferences?.channel ?? "");
                                      appPreferences?.setString(
                                          state.data.customer ?? "",
                                          appPreferences?.name ?? "");
                                      appPreferences?.setString(
                                          state.data.phoneNo ?? "",
                                          appPreferences?.phoneNumber ?? "");
                                      appPreferences?.setString(
                                          state.data.email ?? "",
                                          appPreferences?.email ?? "");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LiveChatFirstScreen(
                                              chatId: state.data.chatId,
                                              customer: state.data.customer,
                                              channel: state.data.channel,
                                            ),
                                          ));
                                    } else if (state is NewChatErrorState) {
                                      EasyLoading.dismiss();
                                      Fluttertoast.showToast(
                                          msg: state.errorMessage);
                                    }
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      if (nameController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please add Name");
                                      } else if (emailController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please add Email");
                                      } else if (nameController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please add Name");
                                      } else if (phoneController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please add Phone Number");
                                      } else if (!(RegExp(
                                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                          .hasMatch(emailController.text))) {
                                        Fluttertoast.showToast(
                                            msg: 'Please enter valid email');
                                      } else {
                                        BlocProvider.of<NewChatBloc>(context)
                                            .add(NewChatRefreshEvent(
                                                channel: "chat",
                                                customer: nameController.text,
                                                email: emailController.text,
                                                phoneNo: phoneController.text));
                                      }
                                    },
                                    child: Container(
                                      height: 35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blackColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        StringHelper.continueChatting,
                                        style: const TextStyle(
                                            color: ColorConstant.whiteColor,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.h
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
