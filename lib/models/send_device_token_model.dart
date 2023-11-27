class SendDeviceTokenModel {
  final String? firebaseToken, serverKey;

  SendDeviceTokenModel(
      {this.firebaseToken, this.serverKey});

  factory SendDeviceTokenModel.fromJson(Map<String, dynamic> json) => SendDeviceTokenModel(
        firebaseToken: json['token'],
        serverKey: json['serverKey'],
      );

  Map<String, dynamic> toJson() => {
        'token': firebaseToken,
        'serverKey': serverKey,
      };
}
