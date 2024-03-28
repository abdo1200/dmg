import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/features/home/domain/entites/nearby_response/nearby_response.dart';
import 'package:clean_arc/features/home/domain/entites/nearby_search.dart'
    as nearby_package;
import 'package:clean_arc/features/home/domain/entites/place_directions.dart';
import 'package:clean_arc/resource/generated/assets.gen.dart';
import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/helpers/location_helper.dart';
import 'package:clean_arc/src/core/preferences/Prefs.dart';
import 'package:clean_arc/src/core/webservices/places_webservices.dart';
import 'package:clean_arc/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:injectable/injectable.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  GoogleMapController? mapController;
  Position? position;

  List<PlaceSuggestion> places = [];
  NearbyListRespone? mosques;
  CameraPosition? myCurrentLocationCameraPosition;
  final sessionToken = const Uuid().v4();
  bool isTimeAndDistanceVisible = false;
  PlaceSuggestion? placeSuggestion;
  nearby_package.NearbyBuses? nearby;
  CameraPosition? goToSearchedForPlace;
  Set<Marker> markers = {};
  Marker? searchedPlaceMarker;
  Marker? currentLocationMarker;
  bool isSearchedPlaceMarkerClicked = false;
  bool isFavourite = false;
  final FloatingSearchBarController controller = FloatingSearchBarController();

  bool hide = false;
  PlaceDirections? placeDirections;
  List<LatLng> polylinePoints = [];
  String? selectedType;
  List<PlaceSuggestion> favouritePlaces = [];
  List<String> favouritePlacesKeys = [];
  bool clearEnable = false;
  bool openFilter = false;
  TextEditingController service = TextEditingController();
  TextEditingController raduis = TextEditingController();
  bool locationEnabled = false;
  StreamSubscription<ServiceStatus>? _location;
  bool serviceStatus = true;

  load(BuildContext context) async {

    emit(HomeInitial());   
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    _location = Geolocator.getServiceStatusStream()
        .listen((ServiceStatus status) async {
      if (status == ServiceStatus.disabled) {
        serviceStatus = false;
        print(serviceStatus);
        emit(HomeLoaded());
      } else {
        serviceStatus = true;
        load(context);
        print(serviceStatus);
      }
    });
    if (serviceStatus) {
      await LocationHelper.getCurrentLocation().then((value) {
        position = value;
      });
      myCurrentLocationCameraPosition = CameraPosition(
        bearing: 0.0,
        target: LatLng(position!.latitude, position!.longitude),
        tilt: 0.0,
        zoom: Platform.isIOS ? 14 : 15,
      );
      favouritePlaces = context.read<AppBloc>().savedPlaces ?? [];
      print(favouritePlaces);
    }
    emit(HomeLoaded());
  }


  Future<void> fetchSuggestions(String place) async {
    emit(SearchLoading());
    final suggestions =
        await PlacesWebservices().fetchSuggestions(place, sessionToken);
    places = suggestions
        .map((suggestion) => PlaceSuggestion.fromSugg(suggestion))
        .toList();
    emit(SearchLoaded());
  }

  Future<void> getPlaceDetails(String place) async {
    emit(HomeLoading());
    final suggestions =
        await PlacesWebservices().getPlaceLocation(place, sessionToken);
    print(suggestions);
    emit(SearchLoaded());
  }

  Future<NearbyListRespone> fetchNearby(String type, String raduis) async {
    emit(HomeLoading());
    var suggestions = await PlacesWebservices().getNearPlaces(
        LatLng(position!.latitude, position!.longitude), type, raduis);
    return NearbyListRespone.fromJson(suggestions);
  }

  Future<PlaceSuggestion> getPlaceLocation(String placeId) async {
    var place = await newDetailsApi(placeId);
    return place;
  }

  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlace!.target,
      markerId: const MarkerId('1'),
      onTap: () {
        isSearchedPlaceMarkerClicked = true;
        emit(HomeLoaded());
        isTimeAndDistanceVisible = true;
        emit(HomeLoaded());
      },
      infoWindow: InfoWindow(title: placeSuggestion!.description),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    // buildCurrentLocationMarker();
    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker!);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    markers.add(marker);
    emit(HomeLoaded());
  }

  Future<void> goToMyCurrentLocation() async {

    try{
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition!));
    }catch(e){
      print(e);
    }
    emit(HomeLoaded());
  }

  Future<void> getDirections() async {
    clearEnable = true;
    emit(HomeLoading());
    if (placeSuggestion!.lat == null) {
      var result = await getPlaceLocation(placeSuggestion!.placeId!);
      placeSuggestion!.lat = result.lat;
      placeSuggestion!.lng = result.lng;
    }
    final directions = await PlacesWebservices().getDirections(
        LatLng(position!.latitude, position!.longitude),
        LatLng(placeSuggestion!.lat!, placeSuggestion!.lng!));

    await goToMyCurrentLocation();
    placeDirections = PlaceDirections.fromJson(directions);
    polylinePoints = PlaceDirections.fromJson(directions)
        .polylinePoints
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();
    emit(HomeLoaded());
  }

  clearLocation() {
    placeSuggestion = null;
    placeDirections = null;
    polylinePoints.clear();
    clearEnable = false;
    emit(HomeLoaded());
  }

  searchService(BuildContext context) async {
    if (service.text == '' || raduis.text == '') {
      AnimatedSnackBar.material(
        service.text == '' ? 'Please Enter Service' : 'Please Enter Raduis',
        duration: const Duration(seconds: 2),
        type: AnimatedSnackBarType.error,
      ).show(context);
    } else {
      markers.clear();
      mosques = null;
      mosques = await fetchNearby(
          service.text.trim().toLowerCase(), raduis.text.trim().toLowerCase());
      List<NearbyResponse> mosquesResponse =
          mosques!.items!.cast<NearbyResponse>();
      for (int i = 0; i < mosques!.items!.length; i++) {
        print(mosquesResponse[i].placeId);
        markers.add(Marker(
            markerId: MarkerId(mosquesResponse[i].name ?? ''),
            onTap: () {
              placeSuggestion = PlaceSuggestion(
                  name: mosquesResponse[i].name ?? '',
                  lat: mosquesResponse[i].geometry!.location!.lat!,
                  lng: mosquesResponse[i].geometry!.location!.lng!,
                  description: mosquesResponse[i].vicinity ?? '',
                  imageUrl: '',
                  placeId: mosquesResponse[i].placeId ?? '');
              clearEnable = true;
              emit(HomeLoaded());
            },
            position: LatLng(mosquesResponse[i].geometry!.location!.lat!,
                mosquesResponse[i].geometry!.location!.lng!),));
      }
      await goToMyCurrentLocation();
      emit(HomeLoaded());
    }
  }

  resetService() {
    markers.clear();
    mosques = null;
    selectedType = null;
    openFilter = false;
    emit(HomeLoaded());
  }

  Future<PlaceSuggestion> newDetailsApi(String placeId) async {
    final result = await PlacesWebservices().getPlaceDetails(placeId);
    print(result);
    return PlaceSuggestion.fromNewApi(result);
  }

  selectSuggestion(index) async {
    clearEnable = true;
    placeSuggestion = await getPlaceLocation(places[index].placeId!);
    controller.close();
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        placeSuggestion!.lat!,
        placeSuggestion!.lng!,
      ),
      zoom: 13,
    );
    mapController!
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace!));
    buildSearchedPlaceMarker();
  }

  selectSavedItem(index) async {
    clearEnable = true;
    placeSuggestion = favouritePlaces[index];
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        placeSuggestion!.lat!,
        placeSuggestion!.lng!,
      ),
      zoom: 13,
    );
    mapController!
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace!));
    buildSearchedPlaceMarker();
  }

  savePlace(context) async {
    var place = await newDetailsApi(placeSuggestion!.placeId ?? '');
    Prefs prefs = getIt<Prefs>();
    if (favouritePlaces
        .where((element) => element.placeId == place.placeId)
        .isNotEmpty) {
      favouritePlaces
          .removeWhere((element) => element.placeId == place.placeId);
      prefs.setSavedPlaces(jsonEncode(favouritePlaces));
      AnimatedSnackBar.material(
        'Place deleted from favourits',
        duration: const Duration(seconds: 2),
        type: AnimatedSnackBarType.success,
      ).show(context);
    } else {
      favouritePlaces.add(place);
      prefs.setSavedPlaces(jsonEncode(favouritePlaces));
      // ignore: use_build_context_synchronously
      AnimatedSnackBar.material(
        'Place added to favourits successfully',
        duration: const Duration(seconds: 2),
        type: AnimatedSnackBarType.success,
      ).show(context);
    }
    emit(HomeLoaded());
  }

  refresh() {
    emit(HomeLoaded());
  }
}
