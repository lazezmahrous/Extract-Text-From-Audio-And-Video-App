import 'package:extract_text_from_audio_and_video/features/home/logic/cubit/get_all_extracted_text_files_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/network/dio_factory.dart';
import '../../logic/cubit/upload_file_cubit.dart';
import '../../logic/cubit/upload_file_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'show_extract_text.dart';

class UploadAudioFileBlocListner extends StatefulWidget {
  const UploadAudioFileBlocListner({super.key});

  @override
  State<UploadAudioFileBlocListner> createState() =>
      _UploadAudioFileBlocListnerState();
}

class _UploadAudioFileBlocListnerState
    extends State<UploadAudioFileBlocListner> {
  Future<String> getText(String url) async {
    final response = await DioFactory.dio!.get(url);
    return response.data;
  }

  String? fileUrl = '';

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllExtractedTextFilesCubit>(),
      child: BlocListener<UploadFileCubit, UploadFileState>(
        listener: (context, state) {
          state.whenOrNull(initial: () {
            setState(() {
              fileUrl = '';
              controller.clear();
            });
          }, success: (e) async {
            context
                .read<GetAllExtractedTextFilesCubit>()
                .emitGetAllExtractedTextFiles();
            controller.text = await getText(e.fileUrl);

            setState(() {
              fileUrl = e.fileUrl;
            });
          });
        },
        child: fileUrl!.isEmpty
            ? const SizedBox.shrink()
            : ShowExtractText(
                fileUrl: fileUrl!,
                isHomePage: false,
              ),
      ),
    );
  }
}
