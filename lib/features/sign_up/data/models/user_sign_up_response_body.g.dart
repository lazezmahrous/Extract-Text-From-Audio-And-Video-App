// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpResponseBody _$UserSignUpResponseBodyFromJson(
        Map<String, dynamic> json) =>
    UserSignUpResponseBody(
      fullName: json['full_name'] as String,
      token: json['token'] as String,
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserSignUpResponseBodyToJson(
        UserSignUpResponseBody instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'token': instance.token,
      'code': instance.code,
      'message': instance.message,
    };
