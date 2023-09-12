class EnifUserParams {
  final String? firstName, lastName, email, phoneNo;

  String get name => '${firstName ?? ''} ${lastName ?? ' '}';

  EnifUserParams(
      {this.firstName, this.lastName, this.email, required this.phoneNo});
}
