// ignore_for_file: must_be_immutable
import 'package:extract_text_from_audio_and_video/features/on_borading/data/on_boarding_data.dart';
import 'package:extract_text_from_audio_and_video/features/on_borading/logic/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class NextAndSkipWidgets extends StatefulWidget {
  const NextAndSkipWidgets({
    super.key,
  });

  @override
  State<NextAndSkipWidgets> createState() => _NextAndSkipWidgetsState();
}

class _NextAndSkipWidgetsState extends State<NextAndSkipWidgets> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        state.whenOrNull(pageChanged: () {
          setState(() {});
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (context.read<OnBoardingCubit>().currentIndex == 0) {
                context.read<OnBoardingCubit>().skip();
              } else {
                context.read<OnBoardingCubit>().back();
              }
            },
            child: Text(
              context.read<OnBoardingCubit>().currentIndex == 0
                  ? 'Skip'
                  : 'Back',
              style: TextStyle(
                fontSize: 15.0.sp,
                color: ColorsManager.gray,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (context.read<OnBoardingCubit>().currentIndex + 1 !=
                  OnBoardingData.screens.length) {
                context.read<OnBoardingCubit>().next();
              } else {
                context.read<OnBoardingCubit>().getStarted();
              }
            },
            child: context.read<OnBoardingCubit>().currentIndex + 1 !=
                    OnBoardingData.screens.length
                ? Container(
                    width: 57.w,
                    height: 57.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: ColorsManager.mainBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorsManager.mainWhite,
                      ),
                    ),
                  )
                : Container(
                    width: 170.w,
                    height: 47.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        color: ColorsManager.mainBlue,
                        borderRadius: BorderRadius.all(Radius.circular(23.r))),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyles.font15BlueSemiBold,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
