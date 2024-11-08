import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../models/user_login_request_body.dart';
import '../models/user_login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<UserLoginResponseBody>> login(
      UserLoginRequestBody userLoginRequestBody) async {
    try {
      final response = await _apiService.login(userLoginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
