import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routers.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Dont have account ?',
            style: TextStyles.font14DarkBlueMedium,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font15BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
