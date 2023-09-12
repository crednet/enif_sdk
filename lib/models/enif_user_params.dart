class EnifUserParams {
  final String? firstName, lastName, email, phoneNo;

  String get name => '${firstName ?? ''} ${lastName ?? ' '}';

  EnifUserParams(
      {this.firstName, this.lastName, this.email, required this.phoneNo});

  factory EnifUserParams.fromJson(Map<String, dynamic> json) => EnifUserParams(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNo: json['phoneNo'],
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNo': phoneNo,
      };
}
