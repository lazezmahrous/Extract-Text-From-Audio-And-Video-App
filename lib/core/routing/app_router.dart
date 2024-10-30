import 'package:extract_text_from_audio_and_video/core/di/dependency_injection.dart';
import 'package:extract_text_from_audio_and_video/features/on_borading/ui/screens/onboard_screen.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:extract_text_from_audio_and_video/core/routing/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/on_borading/logic/cubit/on_boarding_cubit.dart';
import '../../features/sign_up/ui/screens/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
