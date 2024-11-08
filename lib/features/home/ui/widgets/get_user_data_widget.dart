import 'package:extract_text_from_audio_and_video/core/helpers/hive_helper.dart';
import 'package:extract_text_from_audio_and_video/core/theming/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/global_data/models/user_data_model.dart';
import '../../../../core/theming/colors.dart';

class GetUserDataWidget extends StatefulWidget {
  const GetUserDataWidget({super.key});
  @override
  State<GetUserDataWidget> createState() => _GetUserDataWidgetState();
}

class _GetUserDataWidgetState extends State<GetUserDataWidget> {
  @override
  void initState() {
    super.initState();
    userData = HiveHeleper.getUserData();
  }

  late UserDataModel userData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${userData.userName}',
              style: TextStyles.font22BlackBold,
            ),
            Text(
              userData.userEmail,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: ColorsManager.mainBlue,
          ),
        ),
      ],
    );
  }
}
