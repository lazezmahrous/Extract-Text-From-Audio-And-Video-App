import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'extract_text_from_audio_and_video_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(
    ExtractTextFromAudioAndVideoApp(
      appRouter: AppRouter(),
    ),
  );
}
