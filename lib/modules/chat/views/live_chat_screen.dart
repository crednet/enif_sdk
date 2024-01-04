import 'package:enif/enif.dart';
import 'package:flutter/cupertino.dart';

class LivechatScreen extends StatelessWidget {
  const LivechatScreen({super.key, this.newMessage = false});
  final bool newMessage;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: EnifController().chatSession,
        builder: (context, value, child) {
          // if (value != null) {
          //   return ChatScreen(session: value);
          // }
          return const ChatConnectionScreen();
        });
  }
}
