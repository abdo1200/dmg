import 'package:clean_arc/src/core/preferences/constants.dart';
import 'package:dio/dio.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesWebservices {
  late Dio dio;

  PlacesWebservices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 20 * 1000),
      receiveTimeout: const Duration(milliseconds: 20 * 1000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    print(sessionToken);
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'types': 'address',
          'components': 'country:eg',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        },
      );

      return response.data['predictions'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }

  // origin equals current location
  // destination equals searched for location
  Future<dynamic> getDirections(LatLng origin, LatLng destination) async {
    try {
      Response response = await dio.get(
        directionsBaseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': googleAPIKey,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }

  Future<dynamic> getNearPlaces(LatLng origin, String type,String raduis) async {
    try {
      Response response = await dio.post(
        nearBaseUrl,
        queryParameters: {
          'key': googleAPIKey,
          'location': '${origin.latitude},${origin.longitude}',
          'radius': raduis,
          'type': type.toLowerCase(),
        },
      );

      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }
  Future<dynamic> getPlaceDetails(String placeId) async {
    try {
      Response response = await dio.get(
        newPlaceDetails+placeId,
        options: Options(
          headers: {
           "X-Goog-FieldMask":"id,displayName,formattedAddress,location,rating,userRatingCount",
          }
        ),
        queryParameters: {
          'key': googleAPIKey,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : $error",
          StackTrace.fromString(('this is its trace')));
    }
  }
}
