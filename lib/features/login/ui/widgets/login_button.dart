import 'package:extract_text_from_audio_and_video/core/constant/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:extract_text_from_audio_and_video/features/login/logic/cubit/login_cubit.dart';
import 'package:extract_text_from_audio_and_video/features/login/logic/cubit/login_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/global_widgets/app_gradient_button.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(loading: () {
          setState(() {
            showLoading == !showLoading;
          });
        });
      },
      child: showLoading
          ? const AppLoading()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: AppGradientButton(
                size: Size(double.infinity, 45.h),
                text: 'Login',
                onPressed: () async {
                  if (context
                      .read<LoginCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<LoginCubit>().emitLoginStates();
                  }
                },
              ),
            ),
    );
  }
}
