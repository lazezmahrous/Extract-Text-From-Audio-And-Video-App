import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:extract_text_from_audio_and_video/core/theming/font_weight_helper.dart';

class TextStyles {
  TextStyles._();

  static TextStyle font26SemiBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );

  static TextStyle font15BlueSemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.gray,
  );
}
