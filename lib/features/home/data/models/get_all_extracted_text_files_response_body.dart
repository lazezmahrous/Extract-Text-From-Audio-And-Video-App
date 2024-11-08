// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'get_all_extracted_text_files_response_body.g.dart';

@JsonSerializable()
class GetAllExtractedTextFilesResponseBody {
  final Map<String, dynamic> folders;

  GetAllExtractedTextFilesResponseBody({
    required this.folders,
  });

  static GetAllExtractedTextFilesResponseBody fromJson(
          Map<String, dynamic> json) =>
      _$GetAllExtractedTextFilesResponseBodyFromJson(json);
}
