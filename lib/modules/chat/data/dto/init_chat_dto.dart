import 'package:enif/modules/chat/view_model/enif_controller.dart';

class InitChatDto {
  final String customer;
  final String? phoneNo, email;

  InitChatDto({required this.customer, this.phoneNo, this.email});

  Map<String, dynamic> toJson() => {
        "businessId": EnifController.businessId,
        "channel": "chat",
        "customer": customer,
        "phoneNo": phoneNo,
        "email": email
      };
}
