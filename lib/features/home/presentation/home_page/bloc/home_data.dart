import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerItem {
  final int id;
  final LatLng pos;

  MarkerItem({
    required this.id,
    required this.pos,
  });
}
