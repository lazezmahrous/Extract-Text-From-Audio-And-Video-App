import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_loading.dart';
import '../../../../core/constant/app_svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/upload_file_cubit.dart';
import '../../logic/cubit/upload_file_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadAudioFileBlocListener extends StatefulWidget {
  const UploadAudioFileBlocListener({super.key});

  @override
  State<UploadAudioFileBlocListener> createState() =>
      _UploadAudioFileBlocListenerState();
}

class _UploadAudioFileBlocListenerState
    extends State<UploadAudioFileBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadFileCubit, UploadFileState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppSvg.cloudUpload,
                  color: ColorsManager.maingray,
                  width: 50.w,
                ),
                verticalSpace(10),
                Text(
                  'Import your file',
                  style: TextStyles.font14LGrayBold,
                ),
              ],
            );
          },
          loading: () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLoading(),
                verticalSpace(10),
                Text('Uploading...', style: TextStyles.font14LGrayBold),
              ],
            );
          },
          success: (extractTextResponseBody) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppSvg.memoCircleCheck,
                          color: ColorsManager.mainBlue,
                          width: 50.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Successfully uploaded',
                              style: TextStyle(
                                  color: ColorsManager.mainBlue,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<UploadFileCubit>()
                                    .emitInitialStates();
                              },
                              child: const Row(
                                children: [Text('upload Another File')],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
          error: () {
            return const Text('error');
          },
        );
      },
    );
  }
}



// 
