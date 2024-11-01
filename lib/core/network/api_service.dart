import 'package:extract_text_from_audio_and_video/features/login/data/models/user_login_request_body.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/login/data/models/user_login_response_body.dart';
import '../../features/sign_up/data/models/user_sign_up_request_body.dart';
import '../../features/sign_up/data/models/user_sign_up_response_body.dart';
import 'api_constants.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signup)
  Future<UserSignUpResponseBody> signUp(
      @Body() UserSignUpRequestBody userSignUpRequest);

  @POST(ApiConstants.login)
  Future<UserLoginResponseBody> login(
      @Body() UserLoginRequestBody userLoginRequestBody);
}
