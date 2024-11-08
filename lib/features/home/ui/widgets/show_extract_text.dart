import 'package:extract_text_from_audio_and_video/core/constant/app_svg.dart';
import 'package:extract_text_from_audio_and_video/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_loading.dart';
import '../../../../core/global_widgets/app_text_form_field.dart';
import '../../../../core/helpers/show_snack_bar.dart';
import '../../../../core/network/dio_factory.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowExtractText extends StatefulWidget {
  const ShowExtractText(
      {super.key, required this.fileUrl, required this.isHomePage});

  final String fileUrl;
  final bool isHomePage;
  @override
  State<ShowExtractText> createState() => _ShowExtractTextState();
}

class _ShowExtractTextState extends State<ShowExtractText> {
  Future<String> getText(String url) async {
    final response = await DioFactory.dio!.get(url);
    return response.data;
  }

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getText(widget.fileUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoading();
        } else if (snapshot.hasError) {
          return const Text('Error fetching data');
        } else {
          controller.text = snapshot.data.toString();
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: snapshot.data.toString()));
                        showSnackBarBlue(context, 'Copy Successfully');
                      },
                      child: SvgPicture.asset(AppSvg.copyAlt),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 400.w,
                      ),
                      child: widget.isHomePage
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 10.w),
                              child: Text(
                                snapshot.data.toString(),
                                style: TextStyles.font13DarkGrayRegular,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : AppTextFormField(
                              hintText: '',
                              keyboardType: TextInputType.multiline,
                              controller: controller,
                              onChanged: (value) {
                                controller.text = value;
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
