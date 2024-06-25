import 'package:flutter/material.dart';

import '../../../../core/theme_manager/color_manager.dart';
import '../../../../core/theme_manager/values_manager.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  const TextWidget(
      {super.key,
      required this.title,
      this.fontWeight = FontWeight.bold,
      this.color = Colors.white,
      this.fontSize = AppSize.s20});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.brightness == Brightness.light ? ColorManager.black : ColorManager.white;
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,

    );
  }
}
