import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/show_snack_bar.dart';
import '../../../../core/routing/routers.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});
  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (messageError) {
            showSnackBarEror(context, messageError);
          },
          success: (user) async {
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              arguments: null,
              predicate: (route) => false,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
