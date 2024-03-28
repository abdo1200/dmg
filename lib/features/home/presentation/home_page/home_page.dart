import 'package:auto_route/auto_route.dart';
import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/features/home/domain/entites/place_directions.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/direction_btn.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/favourits_widget.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/save_btn.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/floating_search.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/services_widget.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/map_section.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/my_location_btn.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/src/core/preferences/constants.dart';
import 'package:clean_arc/src/core/widget/loading/full_over_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // FloatingSearchBarController controller = FloatingSearchBarController();
  late String mapStyle;
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  late String time;
  late String distance;
  GoogleMapController? mapController;
  bool stationsEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var bloc = context.read<HomeCubit>();
        return Scaffold(
          body: Stack(children: [
            MapSection(),
            if (!bloc.clearEnable)
              Align(
                  alignment: Alignment.bottomLeft,
                  child:
                      FavouritsWidget(favouritePlaces: bloc.favouritePlaces)),
            // ignore: prefer_const_constructors
            if (!bloc.clearEnable)
              Padding(
                padding: const EdgeInsets.all(8.0),
                // ignore: prefer_const_constructors
                child: ServicesWidget(),
              ),
            // ignore: prefer_const_constructors
            if (!bloc.openFilter || bloc.clearEnable) FloatingSearch(),
            if (state is HomeLoading) const FullOverLoading(),
            (bloc.placeSuggestion) != null
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      padding: const EdgeInsets.all(10),
                      height: height(context) * .08,
                      width: width(context) * .93,
                      decoration: BoxDecoration(
                          color: AppColors.current.primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ignore: prefer_const_constructors
                          DirectionBtn(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (bloc.placeSuggestion!.name != '')
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      bloc.placeSuggestion!.name ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      bloc.placeSuggestion!.description ?? '',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SaveBtn(),
                        ],
                      ),
                    ),
                  )
                : Container()
          ]),
          floatingActionButton: const Stack(
            children: [
              MyLocationBtn(),
            ],
          ),
        );
      },
    ));
  }
}
