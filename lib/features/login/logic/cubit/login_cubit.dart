import 'package:bloc/bloc.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/shared_pref_constans.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/shared_pref_helper.dart';
import 'package:extract_text_from_audio_and_video/features/login/data/models/user_login_request_body.dart';
import 'package:extract_text_from_audio_and_video/features/login/data/repos/login_repo.dart';
import 'package:extract_text_from_audio_and_video/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/global_data/models/user_data_model.dart';
import '../../../../core/helpers/hive_helper.dart';
import '../../../../core/network/dio_factory.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(UserLoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));
    response.when(success: (loginResponse) async {
      await saveToken(loginResponse.token);
      saveUserData(UserDataModel(userName: loginResponse.email, userEmail: loginResponse.email), loginResponse.token);
      DioFactory.setTokenIntoHeaderAfterLogin(loginResponse.token);
      emit(LoginState.success(user: loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> saveToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }

  Future<void> saveUserData(UserDataModel userData, String token) async {
    print(userData.userEmail);
    await HiveHeleper.saveUserData(userData);
  }
}
