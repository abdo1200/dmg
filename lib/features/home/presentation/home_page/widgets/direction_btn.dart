import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectionBtn extends StatelessWidget {
  const DirectionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();
    return InkWell(
      onTap: () async {
        if (bloc.placeDirections != null) {
          bloc.clearLocation();
        } else {
          await bloc.getDirections();
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.current.secondaryColor,
        ),
        child: Icon(
            bloc.placeDirections != null ? Icons.clear : Icons.directions,
            color: Colors.white),
      ),
    );
  }
}
