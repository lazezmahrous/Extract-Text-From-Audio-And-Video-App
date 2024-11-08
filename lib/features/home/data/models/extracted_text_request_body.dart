import 'package:json_annotation/json_annotation.dart';

part 'extracted_text_request_body.g.dart';
@JsonSerializable()
class ExtractedTextRequestBody {
  final String email;
  final String filename;
  ExtractedTextRequestBody({
    required this.email,
    required this.filename,
  });
}
