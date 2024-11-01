import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theming/colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: ColorsManager.secondBlueColor,
      size: 50,
    );
  }
}
