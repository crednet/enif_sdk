import 'package:data_repository/data_repository.dart';

class EnifError extends ApiError {
  EnifError(super.message, super.code);

  factory EnifError.fromJson(Map<String, dynamic> json) =>
      EnifError(json['message'] ?? '', 100);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    return data;
  }
}
