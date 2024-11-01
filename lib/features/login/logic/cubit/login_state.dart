import 'package:extract_text_from_audio_and_video/features/login/data/models/user_login_response_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';


@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success({required UserLoginResponseBody user}) = Success;
  const factory LoginState.error({required String error}) = Error;
}
