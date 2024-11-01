// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponseBody _$UserLoginResponseBodyFromJson(
        Map<String, dynamic> json) =>
    UserLoginResponseBody(
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserLoginResponseBodyToJson(
        UserLoginResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'token': instance.token,
    };
