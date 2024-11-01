import 'package:extract_text_from_audio_and_video/core/constant/app_images.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/show_snack_bar.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/spacing.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/data/models/user_sign_up_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import '../../logic/cubit/sign_up_state.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/sign_up_button.dart';
import '../widgets/sign_up_from.dart';
import '../widgets/terms_and_conditions_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(error: (errorMessage) {
          showSnackBarEror(context, errorMessage);
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.signUpImage),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyles.font32SemiBold,
                      ),
                    ],
                  ),
                  verticalSpace(20.h),
                  const SignUpFromWidget(),
                  verticalSpace(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const TermsAndConditionsText(),
                  ),
                  verticalSpace(20.h),
                  const SignUpButton(),
                  verticalSpace(20.h),
                  const AlreadyHaveAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}