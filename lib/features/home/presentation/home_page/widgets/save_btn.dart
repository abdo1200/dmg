import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/src/core/preferences/Prefs.dart';
import 'package:clean_arc/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveBtn extends StatelessWidget {
  const SaveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();
    return InkWell(
      onTap: () {
        bloc.savePlace(context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.current.secondaryColor,
        ),
        child: Icon(
            bloc.favouritePlaces
                    .where((element) =>
                        element.placeId == bloc.placeSuggestion!.placeId!)
                    .isNotEmpty
                ? Icons.bookmark_remove_rounded
                : Icons.bookmark_add_outlined,
            color: Colors.white),
      ),
    );
  }
}
