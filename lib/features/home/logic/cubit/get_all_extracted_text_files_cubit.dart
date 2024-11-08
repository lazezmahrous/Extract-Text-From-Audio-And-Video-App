import 'package:bloc/bloc.dart';

import '../../data/repo/home_repo.dart';
import 'get_all_extracted_text_files_state.dart';

class GetAllExtractedTextFilesCubit
    extends Cubit<GetAllExtractedTextFilesState> {
  final HomeRepo _homeRepo;
  GetAllExtractedTextFilesCubit(this._homeRepo)
      : super(const GetAllExtractedTextFilesState.initial());

  void emitGetAllExtractedTextFiles() async {
    emit(const GetAllExtractedTextFilesState.loading());

    final response = await _homeRepo.getTextFile();

    response.when(success: (getAllExtractedTextFilesResponseBody) {
      emit(GetAllExtractedTextFilesState.success(
          allExtractedTextFiles: getAllExtractedTextFilesResponseBody));
    }, failure: (error) {
      emit(GetAllExtractedTextFilesState.error(
          error: error.apiErrorModel.message ?? ''));
    });
  }
}
