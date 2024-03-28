import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLocationBtn extends StatelessWidget {
  const MyLocationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: FloatingActionButton(
                    backgroundColor: AppColors.current.primaryColor,
                    onPressed: () {
                      context.read<HomeCubit>().goToMyCurrentLocation();
                    },
                    child: Icon(Icons.share_location_rounded,
                        color: AppColors.current.witheColor),
                  ),
                ),
              );
  }
}