import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FullOverLoading extends StatelessWidget {
  const FullOverLoading({Key? key, this.isDialog = true, this.size})
      : super(key: key);
  final bool isDialog;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: isDialog,
          child: Container(
              // color: AppColors.current.dialogBackColor,
              ),
        ),
        CircularProgressIndicator(
          color: AppColors.current.primaryColor,
        )

        // SpinKitCircle(
        //   color: AppColors.current.primaryColor,
        //   size: size ?? 50.0,
        // )
        // Lottie.asset(Assets.images.loadingRingMedium,
        //     fit: BoxFit.fill, height: size ?? 120.w, width: size ?? 120.w),
      ],
    );
  }
}
