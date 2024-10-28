// ignore_for_file: must_be_immutable
import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:extract_text_from_audio_and_video/features/on_borading/data/on_boarding_data.dart';
import 'package:extract_text_from_audio_and_video/features/on_borading/logic/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotsWidget extends StatefulWidget {
  const DotsWidget({
    super.key,
  });

  @override
  State<DotsWidget> createState() => _DotsWidgetState();
}

class _DotsWidgetState extends State<DotsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        state.whenOrNull(pageChanged: () {
          setState(() {});
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: SizedBox(
          height: 10.0,
          child: ListView.builder(
            itemCount: OnBoardingData.screens.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3.0),
                    width: context.read<OnBoardingCubit>().currentIndex == index
                        ? 25.w
                        : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color:
                          context.read<OnBoardingCubit>().currentIndex == index
                              ? ColorsManager.mainBlue
                              : ColorsManager.gray,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
