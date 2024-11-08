import 'dart:io';

import 'package:extract_text_from_audio_and_video/core/network/api_result.dart';
import 'package:extract_text_from_audio_and_video/features/home/data/apis/home_api_service.dart';
import 'package:extract_text_from_audio_and_video/features/home/data/models/extract_text_response_body.dart';

import '../../../../core/helpers/hive_helper.dart';
import '../../../../core/network/api_error_handler.dart';
import '../models/get_all_extracted_text_files_response_body.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<ExtractTextResponseBody>> uploadFile(File? file) async {
    try {
      final userData = HiveHeleper.getUserData();

      final response =
          await _homeApiService.uploadFile(file!, userData.userEmail);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetAllExtractedTextFilesResponseBody>> getTextFile() async {
    try {
      final userData = HiveHeleper.getUserData();

      final response =
          await _homeApiService.getAllExtractedTextFiles(userData.userEmail);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
