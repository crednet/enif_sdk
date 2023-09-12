import 'package:enif/modules/chat/view_model/enif_controller.dart';

class InitChatDto {
  final String customer, phoneNo, email;

  InitChatDto(
      {required this.customer, required this.phoneNo, required this.email});

  Map<String, dynamic> toJson() => {
        "businessId": EnifController.businessId,
        "channel": "chat",
        "customer": customer,
        "phoneNo": phoneNo,
        "email": email
      };
}
