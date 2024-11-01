import 'package:extract_text_from_audio_and_video/features/sign_up/data/models/user_sign_up_request_body.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/data/models/user_sign_up_response_body.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<UserSignUpResponseBody>> signup(
      UserSignUpRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
