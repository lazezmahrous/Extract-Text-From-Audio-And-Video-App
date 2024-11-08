// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'extract_text_response_body.g.dart';
@JsonSerializable()
class ExtractTextResponseBody {
  @JsonKey(name: 'file_url')
  final String fileUrl;
  final String message;
  ExtractTextResponseBody({
    required this.fileUrl,
    required this.message,
  });

  static ExtractTextResponseBody fromJson(Map<String, dynamic> json) => _$ExtractTextResponseBodyFromJson(json);
}
