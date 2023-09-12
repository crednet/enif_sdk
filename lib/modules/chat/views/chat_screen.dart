import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/modules/chat/widget/chat_input_widget.dart';
import 'package:enif/modules/common/chat_users.dart';
import 'package:flutter/material.dart';

import '../view_model/chat_controller.dart';
import '../widget/chat_message_widget.dart';

class ChatScreen extends StatefulWidget {
  final ChatSession session;
  const ChatScreen({super.key, required this.session});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatController controller;

  @override
  void initState() {
    controller = ChatController(widget.session);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.backgroundColor,
        resizeToAvoidBottomInset: true,
        body: Scaffold(
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
                height: 150,
                child:
                    SafeArea(child: ChatInputWidget(controller: controller))),
            body: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, value, child) =>
                        (value.messages?.isEmpty ?? true)
                            ? Column(children: [
                                55.0.h,
                                const Center(child: ChatUsers()),
                                11.h,
                                Text(
                                  'How can we be of help today...',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: context.textColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                20.0.h
                              ])
                            : const SizedBox()),
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: controller,
                      builder: (context, value, child) {
                        return ListView.builder(
                            controller: controller.scrollController,
                            physics: const BouncingScrollPhysics(),
                            // shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            itemCount: value.messages?.length ?? 0,
                            itemBuilder: (context, index) {
                              var message = value.messages![index];
                              return ChatMessageWidget(message: message);
                            });
                      }),
                ),
              ],
            )));
  }
}
