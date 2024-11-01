import 'package:retrofit/retrofit.dart';
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
}
