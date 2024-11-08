import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/cubit/upload_file_cubit.dart';
import 'upload_audio_file_bloc_builder.dart';

class UploadAudioFileWidget extends StatefulWidget {
  const UploadAudioFileWidget({super.key});

  @override
  State<UploadAudioFileWidget> createState() => _UploadAudioFileWidgetState();
}

class _UploadAudioFileWidgetState extends State<UploadAudioFileWidget> {
  Future<void> _pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'mp4', 'mov'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        File file = File(filePath);
        String fileName = file.path.split('/').last;

        final multipartFile = await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        );

        context.read<UploadFileCubit>().file = file;
      }
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _pickAndUploadFile();
        context.read<UploadFileCubit>().emitUploadFileStates();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [10, 10],
        color: ColorsManager.maingray,
        strokeWidth: 2,
        child: Container(
          width: double.infinity,
          height: 170.h,
          decoration: BoxDecoration(
            color: ColorsManager.lighterGray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const UploadAudioFileBlocListener(),
        ),
      ),
    );
  }
}
