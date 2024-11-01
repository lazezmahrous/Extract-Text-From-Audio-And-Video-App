import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_request_body.g.dart';

@JsonSerializable()
class UserSignUpRequestBody {
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  final String password;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;

  UserSignUpRequestBody({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$UserSignUpRequestBodyToJson(this);
}
