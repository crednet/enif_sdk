import 'package:enif/constants/enif_colors.dart';
import 'package:enif/extensions/extensions.dart';
import 'package:enif/models/chat_session.dart';
import 'package:enif/modules/chat/widget/chat_input_widget.dart';
import 'package:enif/modules/common/chat_users.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final ChatSession session;
  const ChatScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
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
            height: 100,
            child: SafeArea(child: ChatInputWidget(session: session))),
        body: Column(
          children: [
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
          ],
        ));
  }
}
