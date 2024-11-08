import 'package:extract_text_from_audio_and_video/features/home/data/models/extract_text_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_file_state.freezed.dart';

@freezed
class UploadFileState with _$UploadFileState {
  const factory UploadFileState.initial() = _Initial;
  const factory UploadFileState.loading() = Loading;
  const factory UploadFileState.success(
      {required ExtractTextResponseBody extractTextResponseBody}) = Success;
  const factory UploadFileState.error() = Error;
}
