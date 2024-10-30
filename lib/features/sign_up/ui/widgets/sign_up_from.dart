import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_svg.dart';
import '../../../../core/global_widgets/app_text_form_field.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import 'sign_up_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFromWidget extends StatefulWidget {
  const SignUpFromWidget({super.key});
  @override
  State<SignUpFromWidget> createState() => _SignUpFromWidgetState();
}

class _SignUpFromWidgetState extends State<SignUpFromWidget> {
  bool isPasswordIsObscureText = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignUpCubit>().formKey,
        child: Column(
          children: [
            SignUpTextField(
              iconPath: AppSvg.icons8Face,
              appTextFormField: AppTextFormField(
                  hintText: 'Full Name',
                  controller: context.read<SignUpCubit>().nameController),
            ),
            SignUpTextField(
              iconPath: AppSvg.at,
              appTextFormField: AppTextFormField(
                controller: context.read<SignUpCubit>().emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ),
            SignUpTextField(
              iconPath: AppSvg.icons8Password,
              appTextFormField: AppTextFormField(
                controller: context.read<SignUpCubit>().passwordController,
                hintText: 'Password',
                isObscureText: isPasswordIsObscureText,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordIsObscureText = !isPasswordIsObscureText;
                    });
                  },
                  child: Icon(
                    isPasswordIsObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorsManager.secondGray,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
              ),
            ),
            SignUpTextField(
              iconPath: AppSvg.icons8Password,
              appTextFormField: AppTextFormField(
                controller:
                    context.read<SignUpCubit>().passwordConfirmationController,
                hintText: 'Confirm Password',
                isObscureText: isPasswordIsObscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordIsObscureText = !isPasswordIsObscureText;
                    });
                  },
                  child: Icon(
                    isPasswordIsObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
              ),
            ),
          ],
        ));
  }
}
