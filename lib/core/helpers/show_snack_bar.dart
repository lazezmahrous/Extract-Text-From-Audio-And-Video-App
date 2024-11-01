import 'package:extract_text_from_audio_and_video/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theming/colors.dart';

void showSnackBarEror(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: ColorsManager.mainReed,
    content: Row(
      children: [
        const Icon(
          Icons.info_outline_rounded,
          color: ColorsManager.mainWhite,
        ),
        horizontalSpace(15),
        Text(
          message,
          style: const TextStyle(
            fontFamily: 'GED',
          ),
        ),
      ],
    ),
  ));
}

void showToast({required String message, required bool isError}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? ColorsManager.pink : ColorsManager.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showSnackBarBlue(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontFamily: 'GED',
        ),
      ),
      backgroundColor: ColorsManager.mainBlue,
    ),
  );
}
