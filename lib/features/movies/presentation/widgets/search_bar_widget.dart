import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';

import '../../../../core/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = theme.brightness == Brightness.light
        ? ColorManager.lightGrey
        : ColorManager.grey1;
    final shadow = theme.brightness == Brightness.light
        ? ColorManager.black.withOpacity(0.2)
        : ColorManager.white.withOpacity(0.2);
    final textColor = theme.brightness == Brightness.light
        ? ColorManager.black54
        : ColorManager.white;
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p20,
          left: AppPadding.p20,
          right: AppPadding.p20,
          bottom: AppPadding.p60),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: shadow, blurRadius: 15, spreadRadius: 3),
          ],
        ),
        child: TextField(
          cursorColor: textColor,
          onChanged: onChanged,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
                color: isDark ? ColorManager.white : ColorManager.black54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      isDark ? ColorManager.grey1! : ColorManager.lightGrey!),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textColor),
              borderRadius: BorderRadius.circular(20.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: AppPadding.p12, horizontal: AppPadding.p16),
            suffixIcon: Icon(Icons.search,
                color: isDark ? ColorManager.white : ColorManager.black54),
            focusColor: ColorManager.white,
            hoverColor: ColorManager.white,
            suffixIconColor: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
