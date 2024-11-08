import 'package:flutter/material.dart';

import '../../../../core/constant/app_svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'get_all_extracted_text_files_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowLastesExtractedTextFiles extends StatelessWidget {
  const ShowLastesExtractedTextFiles({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Extracted Texts',
                  style: TextStyles.font22BlackBold,
                ),
                SvgPicture.asset(AppSvg.squareQuote)
              ],
            ),
            verticalSpace(20),
            GetAllExtractedTextFilesWidget(
              isHomePage: true,
            ),
          ],
        ),
        // Positioned(
        //     bottom: 3,
        //     left: 0,
        //     right: 0,
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 10.h),
        //       child: Container(
        //         padding: const EdgeInsets.symmetric(
        //           vertical: 10,
        //           horizontal: 20,
        //         ),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30.r),
        //           gradient: LinearGradient(
        //             colors: [
        //               Colors.white,
        //               ColorsManager.mainWhite.withOpacity(0.8),
        //             ],
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter,
        //           ),
        //           // color: ColorsManager.darkGray,
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 20.h),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               InkWell(
        //                 onTap: () {},
        //                 child:
        //                     Text('Show All', style: TextStyles.font18BlacBold),
        //               ),
        //               const Spacer(),
        //               Container(
        //                   decoration: const BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     // color: ColorsManager.mainBlue.withOpacity(0.06),
        //                   ),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(15),
        //                     child: SvgPicture.asset(AppSvg.angleRight),
        //                   )),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )),
      ],
    );
  }
}
