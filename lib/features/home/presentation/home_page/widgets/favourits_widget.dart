import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class FavouritsWidget extends StatelessWidget {
  final List<PlaceSuggestion> favouritePlaces;
  const FavouritsWidget({super.key, required this.favouritePlaces});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();
    print(favouritePlaces);
    return favouritePlaces.isNotEmpty
        ? Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: favouritePlaces.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    bloc.selectSavedItem(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.current.primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                        favouritePlaces[index].name??'',
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
