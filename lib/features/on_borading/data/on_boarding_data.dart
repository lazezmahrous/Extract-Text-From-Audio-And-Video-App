import '../../../core/constant/app_images.dart';
import 'models/on_boarding_model.dart';

class OnBoardingData {
  OnBoardingData._();
  static List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: AppImages.soundWave,
      text: "Convert Audio To Text",
      desc: "Transcribe audio/video to text with our online AI transcription tool. No account required.",
    ),
    OnboardModel(
      img: AppImages.uploadFiles,
      text: "Upload a file",
      desc: "Upload a file Click the ‘Select File’ to browse or drag and drop your file.",
    ),
    OnboardModel(
      img: AppImages.convertAudioToSpech,
      text: "Convert audio to text",
      desc: "Select the audio language you want to transcribe. Click ‘Confirm’ to continue.",
    ),
    OnboardModel(
      img: AppImages.videoToText,
      text: "Convert Video to text",
      desc: "Select the Video language you want to transcribe. Click ‘Confirm’ to continue.",
    ),
    
  ];
}
