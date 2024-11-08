// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extracted_text_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtractedTextRequestBody _$ExtractedTextRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ExtractedTextRequestBody(
      email: json['email'] as String,
      filename: json['filename'] as String,
    );

Map<String, dynamic> _$ExtractedTextRequestBodyToJson(
        ExtractedTextRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'filename': instance.filename,
    };
