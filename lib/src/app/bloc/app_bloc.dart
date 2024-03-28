import 'dart:convert';
import 'dart:math';

import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/src/core/helpers/location_helper.dart';
import 'package:clean_arc/src/core/local/locale_constants.dart';
import 'package:clean_arc/src/core/preferences/Prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:el3ab/feature/auth/data/remote/models/init_response.dart';
// import 'package:el3ab/feature/auth/data/remote/models/login_response.dart';
// import 'package:el3ab/feature/auth/domain/use_cases/init_use_case.dart';

import 'package:injectable/injectable.dart';
import 'package:geolocator/geolocator.dart';

part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final Prefs prefs;

  // final InitUseCase _initUseCase;
  // final HomeUseCase _homeUseCase;


  List<PlaceSuggestion>? savedPlaces;

//  List<Categories>? categories;

  // Profile? profile = Profile();

  AppBloc({
    required this.prefs,
  }) : super(const AppInitial()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<AppState> emit) async {
    getUserData();
  }

  void getUserData() async{
    String result =await prefs.savedPlaces;
    List list = result!=''?jsonDecode(result):[];
    savedPlaces=list.map((e){return PlaceSuggestion.fromJson(e);}).toList();
  }

  // Future<void> _appInit() async {
  //   print("$userMode mmmmmm");
  //   var dataState;
  //   if (userMode != "user") {
  //     var data = await Future.value(
  //         [await _homeUseCase(), await _initUseCase(params: "")]);

  //     dataState = (data[1]);
  //     categories = ((data[0].data) as HomeResponse).categories;
  //   } else {
  //     dataState = await _initUseCase(params: "");
  //   }

  //   if (dataState is DataSuccess) {
  //     initResponse = (dataState.data) as InitResponse;
  //     print("hhhhhhhh $initResponse ");
  //     prefs.setInitData(jsonEncode(initResponse));
  //   }
  //   if (dataState is DataFailed || dataState is DataFailedMessage) {
  //     prefs.initDataString.then(
  //         (value) => initResponse = InitResponse.fromJson(jsonDecode(value)));
  //   }
  // }
}
