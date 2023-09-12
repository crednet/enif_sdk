import 'package:enif/enif.dart';
import 'package:enif/modules/chat/views/chat_screen.dart';
import 'package:flutter/cupertino.dart';

import 'chat_connection_screen.dart';

class LivechatScreen extends StatelessWidget {
  const LivechatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: EnifController().chatSession,
        builder: (context, value, child) {
          if (value != null) {
            return ChatScreen(session: value);
          }
          return const ChatConnectionScreen();
        });
  }
}
