import 'dart:io';

import 'package:dio/dio.dart';
import 'package:extract_text_from_audio_and_video/features/home/data/models/get_all_extracted_text_files_response_body.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_constants.dart';
import '../models/extract_text_response_body.dart';
import 'home_api_constans.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @POST('service/${HomeApiConstants.extractTextFromAudio}')
  Future<ExtractTextResponseBody> uploadFile(
    @Part(name: "audio_file") File? file,
    @Part(name: "email") String email,
  );

  @GET('service/extracted_text/{email}')
  Future<GetAllExtractedTextFilesResponseBody> getAllExtractedTextFiles(
    @Path("email") String email,
  );
}
