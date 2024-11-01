import 'package:bloc/bloc.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/data/models/user_sign_up_request_body.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/helpers/shared_pref_constans.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/network/dio_factory.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;

  SignUpCubit(this._signupRepo) : super(const SignUpState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.loading());
    final response = await _signupRepo.signup(
      UserSignUpRequestBody(
        fullName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: passwordConfirmationController.text,
      ),
    );
    response.when(success: (signupResponse) async {
      print(signupResponse.token);
      await saveToken(signupResponse.token);
      DioFactory.setTokenIntoHeaderAfterLogin(signupResponse.token);
      emit(SignUpState.success(user: signupResponse));
    }, failure: (error) {
      emit(SignUpState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> saveToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }
}
