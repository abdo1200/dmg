import 'package:clean_arc/resource/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

Widget emptyView({required String title}) => Container(
    alignment: Alignment.center,
    child: Text(
      "title",
      style: AppTextStyles.s17Primary(),
    ));
