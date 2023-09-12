import 'package:enif/models/chat_session.dart';
import 'package:enif/modules/chat/view_model/enif_controller.dart';

class SendChatDto {
  final String promptMsg;
  final ChatSession session;

  SendChatDto(this.session, this.promptMsg);

  Map<String, dynamic> toJson() => {
        "chatId": session.chatId,
        "businessId": EnifController.businessId,
        "channel": "chat",
        "customer": session.customer,
        "promptMsg": promptMsg
      };
}
