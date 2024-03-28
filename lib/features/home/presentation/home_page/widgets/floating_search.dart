import 'dart:async';

import 'package:clean_arc/features/home/domain/entites/place.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/no_result_fount.dart';
import 'package:clean_arc/features/home/presentation/home_page/widgets/search_places_List.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/src/core/preferences/constants.dart';
import 'package:clean_arc/src/core/widget/loading/full_over_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class FloatingSearch extends StatefulWidget {
  const FloatingSearch({super.key});

  @override
  State<FloatingSearch> createState() => _FloatingSearchState();
}

class _FloatingSearchState extends State<FloatingSearch> {
  late Place selectedPlace;
  bool searchEnabled = false;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var bloc = context.read<HomeCubit>();

    return
        // searchEnabled?
        bloc.clearEnable
            ? Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () async {
                    bloc.clearLocation();
                    bloc.resetService();

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.current.secondaryColor,
                    ),
                    child: Icon(Icons.clear, color: Colors.white),
                  ),
                ),
            )
            : FloatingSearchBar(
                controller: bloc.controller, 
                implicitDuration: Duration(milliseconds: 200),
                insets: EdgeInsets.zero, 
                elevation: 6,
                hintStyle: TextStyle(
                    fontSize: 18, color: AppColors.current.primaryColor),
                queryStyle: TextStyle(
                    fontSize: 18, color: AppColors.current.primaryColor),
                borderRadius: BorderRadius.circular(30),
                backgroundColor: searchEnabled
                    ? AppColors.current.witheColor
                    : AppColors.current.primaryColor,
                hint: searchEnabled ? 'Find a place..' : '',
                border: const BorderSide(style: BorderStyle.none),
                margins: searchEnabled
                    ? const EdgeInsets.fromLTRB(20, 80, 20, 0)
                    : EdgeInsets.fromLTRB(width(context) * .8, 80, 20, 0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 45,
                iconColor: AppColors.current.primaryColor,
                scrollPadding: const EdgeInsets.only(top: 0, bottom: 10),
                transitionDuration: const Duration(milliseconds: 100),
                transitionCurve: Curves.easeInOut,
                physics: const BouncingScrollPhysics(),
                axisAlignment: isPortrait ? 0.0 : -1.0,
                openAxisAlignment: 0.0,
                width: searchEnabled ? width(context) * .9 : 55,
                debounceDelay: const Duration(milliseconds: 100),
                onQueryChanged: (query) async {
                  await bloc.fetchSuggestions(query);
                },
                onFocusChanged: (_) {
                  bloc.isSearchedPlaceMarkerClicked =
                      bloc.isSearchedPlaceMarkerClicked;
                },
                transition: CircularFloatingSearchBarTransition(),
                actions: [
                  FloatingSearchBarAction(
                    showIfOpened: false,
                    child: InkWell(
                        child: Container(
                          width: width(context)*.08,
                          padding: const EdgeInsets.only(right: 0),
                        child: Icon(
                          !searchEnabled ? Icons.search : Icons.clear,
                          color: searchEnabled
                              ? AppColors.current.primaryColor
                              : AppColors.current.witheColor,
                          size: width(context) * .08,
                        ),
                        ),
                        onTap: () {
                          if (!searchEnabled) {
                            setState(() {
                              searchEnabled = true;
                              expanded = true;
                            });
                          } else {
                            Timer.periodic(const Duration(milliseconds: 100),
                                ((timer) {
                              setState(() {
                                searchEnabled = false;
                                expanded = false;
                              });
                              timer.cancel();
                            }));
                          }
                        }),
                  ),
                ],
                builder: (context, transition) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      buildWhen: (previous, current) =>
                          current is SearchLoaded || current is SearchLoading,
                      builder: (context, state) {
                        return state is SearchLoading
                            ? SizedBox(
                                height: height(context) * .5,
                                child: const FullOverLoading())
                            : state is SearchLoaded && bloc.places.isNotEmpty
                                ? BuildPlacesList(
                                    fun: () {
                                      Timer.periodic(
                                          const Duration(milliseconds: 100),
                                          ((timer) {
                                        setState(() {
                                          searchEnabled = false;
                                          expanded = false;
                                        });
                                        timer.cancel();
                                      }));
                                    },
                                  )
                                : state is SearchLoaded?const NoResultFound():SizedBox();
                      },
                    ),
                  );
                },
              );
  }
}
