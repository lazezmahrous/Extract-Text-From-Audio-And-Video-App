import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Icon(
        Icons.arrow_back_ios_new,
        color: ColorsManager.secondGray,
      ),
    );
  }
}
