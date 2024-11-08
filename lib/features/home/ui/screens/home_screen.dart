import 'dart:io';

import 'package:extract_text_from_audio_and_video/core/helpers/spacing.dart';
import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:extract_text_from_audio_and_video/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/get_all_extracted_text_files_widget.dart';
import '../widgets/get_user_data_widget.dart';
import '../widgets/show_lastes_extracted_text_files.dart';
import '../widgets/upload_audio_file_bloc_listener.dart';
import '../widgets/upload_audio_file_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exit(0);
        // logic
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const GetUserDataWidget(),
                  verticalSpace(40),
                  const UploadAudioFileWidget(),
                  verticalSpace(20),
                  const UploadAudioFileBlocListner(),
                  verticalSpace(30),
                  const ShowLastesExtractedTextFiles(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
