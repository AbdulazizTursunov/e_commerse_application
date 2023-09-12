import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;
 final BuildContext? context;

  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,
    this.context
  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 4.0 || strokeWidth == null) {
      return const  CircularProgressIndicator(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.c060302),
      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: strokeWidth!,
        valueColor:const AlwaysStoppedAnimation<Color>(AppColors.white),
      );
    }
  }
}
