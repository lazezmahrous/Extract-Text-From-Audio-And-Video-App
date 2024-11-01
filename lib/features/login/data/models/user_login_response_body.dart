import 'package:json_annotation/json_annotation.dart';

part 'user_login_response_body.g.dart';

@JsonSerializable()
class UserLoginResponseBody {
  final String message;
  final int code;
  final String token;

  UserLoginResponseBody({
    required this.message,
    required this.code,
    required this.token,
  });

  static UserLoginResponseBody fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseBodyFromJson(json);
}
