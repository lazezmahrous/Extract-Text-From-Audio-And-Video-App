import 'package:extract_text_from_audio_and_video/core/constant/app_svg.dart';
import 'package:extract_text_from_audio_and_video/core/global_widgets/app_text_form_field.dart';
import 'package:extract_text_from_audio_and_video/features/login/logic/cubit/login_cubit.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/ui/widgets/sign_up_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordIsObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          SignUpTextField(
            appTextFormField: AppTextFormField(
              hintText: 'Email',
              controller: context.read<LoginCubit>().emailController,
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
            iconPath: AppSvg.at,
          ),
          verticalSpace(10),
          SignUpTextField(
            appTextFormField: AppTextFormField(
              hintText: 'password',
              isObscureText: isPasswordIsObscureText,
              controller: context.read<LoginCubit>().passwordController,
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
            iconPath: AppSvg.icons8Password,
          ),
        ],
      ),
    );
  }
}
