import 'package:enif/constants/enif_colors.dart';
import 'package:enif/custom/custom_textfield.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/chat_users.dart';

class ChatConnectionScreen extends StatefulWidget {
  const ChatConnectionScreen({super.key});

  @override
  State<ChatConnectionScreen> createState() => _ChatConnectionScreenState();
}

class _ChatConnectionScreenState extends State<ChatConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: context.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: EnifColors.primary,
              title: const Text('Live Chat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
            bottomNavigationBar: SizedBox(
                height: 420,
                child: Material(
                    color: context.isDark
                        ? const Color.fromARGB(255, 46, 45, 46)
                        : const Color(0xffE7E6EB),
                    child: SafeArea(
                        child: Column(children: [
                      .0.s,
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(children: [
                            const Text('Tell us about you to start chatting',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            22.0.h,
                            CustomTextField(
                              borderSide: BorderSide.none,
                              fillColor: context.isDark
                                  ? const Color(0xff111111)
                                  : Colors.white,
                              labelText: 'Enter name',
                            ),
                            CustomTextField(
                              borderSide: BorderSide.none,
                              fillColor: context.isDark
                                  ? const Color(0xff111111)
                                  : Colors.white,
                              labelText: 'Email addresss ',
                            ),
                            CustomTextField(
                                borderSide: BorderSide.none,
                                fillColor: context.isDark
                                    ? const Color(0xff111111)
                                    : Colors.white,
                                labelText: 'Phone number'),
                            20.0.h,
                          ])),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: context.isDark
                            ? Colors.white54
                            : const Color(0xffDADADA),
                      ),
                      20.0.h,
                      CupertinoButton(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.black,
                          onPressed: () {},
                          child: Text('Continue Chatting',
                              style: TextStyle(
                                  color: context.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600))),
                      20.0.h,
                    ])))),
            body: Column(
              children: [
                55.0.h,
                const Center(child: ChatUsers()),
                11.h,
                Text(
                  'How can we be of help today...',
                  style: TextStyle(fontSize: 12, color: context.textColor),
                ),
              ],
            ));
      }),
    );
  }
}
