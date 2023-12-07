class SendDeviceTokenDto {
  final String? firebaseToken;

  SendDeviceTokenDto({this.firebaseToken});

  Map<String, dynamic> toJson() => {
        'deviceToken': firebaseToken,
      };
}
