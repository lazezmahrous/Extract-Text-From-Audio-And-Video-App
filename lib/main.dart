import 'package:extract_text_from_audio_and_video/core/global_widgets/app_back_button.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/hive_helper.dart';
import 'core/helpers/shared_pref_constans.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'extract_text_from_audio_and_video_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  await HiveHeleper.initHive();
  await checkIfLoggedInUser();
  runApp(
    ExtractTextFromAudioAndVideoApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
