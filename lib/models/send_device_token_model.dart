class SendDeviceTokenModel {
  final String? customerId,
      deviceToken,
      email,
      fullName,
      businessId,
      id,
      createdAt,
      updatedAt,
      v;

  SendDeviceTokenModel(
      {this.customerId,
      this.businessId,
      this.createdAt,
      this.deviceToken,
      this.email,
      this.fullName,
      this.id,
      this.updatedAt,
      this.v});

  factory SendDeviceTokenModel.fromJson(Map<String, dynamic> json) =>
      SendDeviceTokenModel(
        customerId: json['customerId'],
        fullName: json['fullName'],
        email: json['email'],
        deviceToken: json['deviceToken'],
        businessId: json['businessId'],
        id: json['_id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        v: json['__v'],
      );

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'fullName': fullName,
        'email': email,
        'deviceToken': deviceToken,
        'businessId': businessId,
        '_id': id,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
