import 'package:extract_text_from_audio_and_video/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';

class ShowAudioWidget extends StatelessWidget {
   ShowAudioWidget({super.key, required this.fileUrl});

  String? fileUrl;
  @override
  Widget build(BuildContext context) {
    return VoiceMessageView(
      activeSliderColor: ColorsManager.mainBlue,
      circlesColor: ColorsManager.mainBlue,
      size: 30,
      controller: VoiceController(
        maxDuration: const Duration(seconds: 1),
        isFile: false,
        audioSrc: fileUrl!,
        onComplete: () {
          /// do something on complete
        },
        onPause: () {
          /// do something on pause
        },
        onPlaying: () {
          /// do something on playing
        },
        onError: (err) {
          /// do somethin on error
        },
      ),
      innerPadding: 12,
      cornerRadius: 20,
    );
  }
}
