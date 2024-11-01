import 'package:extract_text_from_audio_and_video/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/show_snack_bar.dart';
import '../../../../core/routing/routers.dart';
import '../../logic/cubit/sign_up_cubit.dart';
import '../../logic/cubit/sign_up_state.dart';

class SignUpBlocListener extends StatefulWidget {
  const SignUpBlocListener({super.key});
  @override
  State<SignUpBlocListener> createState() => _SignUpBlocListenerState();
}

class _SignUpBlocListenerState extends State<SignUpBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(error: (errorMessage) {
          showSnackBarEror(context, errorMessage);
        }, success: (user) async {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            arguments: null,
            predicate: (route) => false,
          );
        });
      },

      child: SizedBox.shrink(),
    );
  }
}
