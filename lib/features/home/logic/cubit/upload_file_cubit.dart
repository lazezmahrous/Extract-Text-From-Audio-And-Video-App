import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:extract_text_from_audio_and_video/features/home/data/repo/home_repo.dart';
import 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  final HomeRepo _homeRepo;
  UploadFileCubit(this._homeRepo) : super(const UploadFileState.initial());

  File? file;
  void emitUploadFileStates() async {
    emit(const UploadFileState.loading());

    final response = await _homeRepo.uploadFile(file!);

    response.when(success: (extractTextResponseBody) {
      print(extractTextResponseBody.fileUrl);
      emit(UploadFileState.success(
          extractTextResponseBody: extractTextResponseBody));
    }, failure: (error) {
      emit(const UploadFileState.error());
    });
  }

  void emitInitialStates() {
    emit(const UploadFileState.initial());
  }
  // void emitGetExtractedTextFile() async {
  //   emit(const UploadFileState.loading());

  //   final response = await _homeRepo.getTextFile(ExtractedTextRequestBody(
  //     email: "ahmed@gmail.com",
  //     filename: "audio.mp3",
  //   ));

  // }
}
