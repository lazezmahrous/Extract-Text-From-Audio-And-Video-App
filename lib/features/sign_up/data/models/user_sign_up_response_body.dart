// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_response_body.g.dart';

@JsonSerializable()
class UserSignUpResponseBody {
  @JsonKey(name: 'full_name')
  final String fullName;
  final String token;
  final String code;
  final String message;
  UserSignUpResponseBody({
    required this.fullName,
    required this.token,
    required this.code,
    required this.message,
  });

  static UserSignUpResponseBody fromJson(Map<String, dynamic> json) =>
      _$UserSignUpResponseBodyFromJson(json);
}
