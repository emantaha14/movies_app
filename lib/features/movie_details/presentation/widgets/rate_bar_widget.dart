import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';

class RateBarWidget extends StatelessWidget {
  const RateBarWidget({super.key,required this.rate});
  final double rate;
  @override
  Widget build(BuildContext context) {
    return
    PannableRatingBar(
      rate: rate,
      items: List.generate(5, (index) =>
       RatingWidget(
        selectedColor: ColorManager.yellow,
        unSelectedColor: ColorManager.grey,
        child: const Icon(
          Icons.star,
          size: AppSize.s21,
        ),
      )),
    );
  }
}
