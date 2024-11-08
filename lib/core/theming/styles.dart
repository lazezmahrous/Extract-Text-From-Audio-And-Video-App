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
  static TextStyle font16DarkSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.dark,
  );

  static TextStyle font15BlueSemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font15GraySemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.maingray,
  );
  static TextStyle font15BlacBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.dark,
  );

  static TextStyle font32SemiBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.dark,
  );
  static TextStyle font15GrayMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.maingray,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.maingray,
  );
  static TextStyle font13DarkGrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondGray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.dark,
  );

  static TextStyle font22BlackBold = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14LGrayBold = TextStyle(
    color: ColorsManager.maingray,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18WhiteBold = TextStyle(
    color: ColorsManager.mainWhite,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18BlacBold = TextStyle(
    color: ColorsManager.dark,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
}
