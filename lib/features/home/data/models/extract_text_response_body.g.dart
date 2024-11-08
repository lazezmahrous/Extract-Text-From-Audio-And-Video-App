// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extract_text_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtractTextResponseBody _$ExtractTextResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ExtractTextResponseBody(
      fileUrl: json['file_url'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ExtractTextResponseBodyToJson(
        ExtractTextResponseBody instance) =>
    <String, dynamic>{
      'file_url': instance.fileUrl,
      'message': instance.message,
    };
