import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/get_all_extracted_text_files_response_body.dart';

part 'get_all_extracted_text_files_state.freezed.dart';

@freezed
class GetAllExtractedTextFilesState
    with _$GetAllExtractedTextFilesState {
  const factory GetAllExtractedTextFilesState.initial() = _Initial;
  const factory GetAllExtractedTextFilesState.loading() = Loading;
  const factory GetAllExtractedTextFilesState.success(
      {required GetAllExtractedTextFilesResponseBody
          allExtractedTextFiles}) = Success;
  const factory GetAllExtractedTextFilesState.error({required String error}) = Error;
}
