import 'package:extract_text_from_audio_and_video/core/constant/app_loading.dart';
import 'package:extract_text_from_audio_and_video/core/di/dependency_injection.dart';
import 'package:extract_text_from_audio_and_video/features/home/logic/cubit/get_all_extracted_text_files_cubit.dart';
import 'package:extract_text_from_audio_and_video/features/home/logic/cubit/get_all_extracted_text_files_state.dart';
import 'package:extract_text_from_audio_and_video/features/home/ui/widgets/show_audio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_extract_text.dart';

class GetAllExtractedTextFilesWidget extends StatefulWidget {
  GetAllExtractedTextFilesWidget({
    super.key,
    required this.isHomePage,
  });

  bool isHomePage = false;
  @override
  State<GetAllExtractedTextFilesWidget> createState() =>
      _GetAllExtractedTextFilesWidgetState();
}

class _GetAllExtractedTextFilesWidgetState
    extends State<GetAllExtractedTextFilesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllExtractedTextFilesCubit>()
        ..emitGetAllExtractedTextFiles(),
      child: BlocBuilder<GetAllExtractedTextFilesCubit,
          GetAllExtractedTextFilesState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const SizedBox.shrink();
            },
            loading: () {
              return const AppLoading();
            },
            success: (allExtractedTextFiles) {
              final folders = allExtractedTextFiles.folders;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: folders.length,
                itemBuilder: (context, index) {
                  final folderData = (folders[index.toString()] as dynamic);

                  print((folderData as dynamic)!['audio_file']);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                        
                      ShowAudioWidget(
                        fileUrl:  (folderData as dynamic)!['audio_file'],
                        
                      ),
                      ShowExtractText(
                        fileUrl:
                            (folderData as dynamic)!['text_file'].toString(),
                        isHomePage: widget.isHomePage,
                      ),
                    ],
                  );
                },
              );
            },
            error: (error) {
              return Center(
                child: Text('Error$error'),
              );
            },
          );
        },
      ),
    );
  }
}
