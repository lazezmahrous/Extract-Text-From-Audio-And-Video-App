import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:extract_text_from_audio_and_video/core/routing/routers.dart';

import 'core/helpers/shared_pref_constans.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';

class ExtractTextFromAudioAndVideoApp extends StatefulWidget {
  const ExtractTextFromAudioAndVideoApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  State<ExtractTextFromAudioAndVideoApp> createState() =>
      _TextToSpechAppState();
}

class _TextToSpechAppState extends State<ExtractTextFromAudioAndVideoApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'HindMysuru',
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: ColorsManager.mainWhite,
          ),
          locale: const Locale('en', 'EN'),
          localizationsDelegates: const [
            // S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          initialRoute:
              isLoggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
          onGenerateRoute: widget.appRouter.generateRoute,
        );
      },
    );
  }
}
