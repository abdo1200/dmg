import 'package:clean_arc/resource/generated/assets.gen.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/resource/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
            color: AppColors.current.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        height: 350,
        child: Column(
          children: [
            Assets.images.noResult.image(),
            Text(
              'No Result Found',
              style: AppTextStyles.s17White()
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
            )
          ],
        ));
  }
}
