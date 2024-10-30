// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpRequestBody _$UserSignUpRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UserSignUpRequestBody(
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirm_password'] as String,
    );

Map<String, dynamic> _$UserSignUpRequestBodyToJson(
        UserSignUpRequestBody instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };
