import 'package:extract_text_from_audio_and_video/core/constant/app_loading.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'package:extract_text_from_audio_and_video/core/routing/routers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global_widgets/app_gradient_button.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import '../../logic/cubit/sign_up_state.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({super.key});
  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(success: (user) {
          print(user);
          context.pushNamed(Routes.homeScreen);
        }, error: (error) {
          print(error);
          setState(() {
            showLoading = !showLoading;
          });
        }, loading: () {
          setState(() {
            showLoading = !showLoading;
          });
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: showLoading
            ? const AppLoading()
            : AppGradientButton(
                onPressed: () {
                  if (context
                      .read<SignUpCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignUpCubit>().emitSignupStates();
                  }
                },
                size: Size(double.infinity, 40.h),
                text: 'Sign Up',
              ),
      ),
    );
  }
}
