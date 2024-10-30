// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/spacing.dart';
import 'package:extract_text_from_audio_and_video/core/routing/routers.dart';
import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:extract_text_from_audio_and_video/core/theming/styles.dart';
import 'package:extract_text_from_audio_and_video/features/on_borading/data/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/on_boarding_model.dart';
import '../../logic/cubit/on_boarding_cubit.dart';
import '../widgets/dots_widget.dart';
import '../widgets/next_and_skip_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  List<OnboardModel> screens = OnBoardingData.screens;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exit(0);
        // logic
      },
      child: BlocListener<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          state.whenOrNull(
            skip: () async {
              await _storeOnboardInfo();
              context.pushReplacementNamed(Routes.signUpScreen);
            },
            next: () async {
              await _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            },
            back: () async {
              await _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            },
            getStarted: () {
              context.pushReplacementNamed(Routes.homeScreen);
            },
          );
        },
        child: Scaffold(
          backgroundColor: ColorsManager.mainWhite,
          body: SafeArea(
            child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                context.read<OnBoardingCubit>().pageChanged(index);
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            screens[index].img,
                          ),
                          verticalSpace(30),
                          Text(
                            screens[index].text,
                            textAlign: TextAlign.center,
                            style: TextStyles.font26SemiBold,
                          ),
                          verticalSpace(5),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 10.h),
                            child: Text(
                              screens[index].desc,
                              textAlign: TextAlign.center,
                              style: TextStyles.font15GraySemiBold,
                            ),
                          ),
                          verticalSpace(20),
                          const Center(
                            child: DotsWidget(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30.h,
                        horizontal: 30.w,
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          child: NextAndSkipWidgets(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
