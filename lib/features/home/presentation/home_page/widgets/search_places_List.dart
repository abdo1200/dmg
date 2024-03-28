import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuildPlacesList extends StatefulWidget {
  final Function fun;
  const BuildPlacesList({super.key, required this.fun});

  @override
  State<BuildPlacesList> createState() => _BuildPlacesListState();
}

class _BuildPlacesListState extends State<BuildPlacesList> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();

    List<PlaceSuggestion>? places = bloc.places;
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () async {
              await bloc.selectSuggestion(index);

              widget.fun();
            },
            child: PlaceItem(
              suggestion: places[index],
            ),
          );
        },
        itemCount: places.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics());
  }
}
