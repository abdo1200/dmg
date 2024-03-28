import 'package:flutter/widgets.dart';

const googleAPIKey = 'AIzaSyAJ0t-OY7l564CIM9JRLHHXoIjN5HHJf2s';
const suggestionsBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';
const placeLocationBaseUrl =
    'https://maps.googleapis.com/maps/api/place/details/json';
const directionsBaseUrl =
    'https://maps.googleapis.com/maps/api/directions/json';
const nearBaseUrl =
    'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
const newPlaceDetails = 'https://places.googleapis.com/v1/places/';

double width(BuildContext context) => MediaQuery.of(context).size.width;
double height(BuildContext context) => MediaQuery.of(context).size.height;
//AIzaSyAJ0t-OY7l564CIM9JRLHHXoIjN5HHJf2s
