import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/src/core/widget/loading/full_over_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSection extends StatelessWidget {
  MapSection({super.key});
  //late String mapStyle;


  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();
    print(bloc.placeDirections);
    return bloc.state is HomeInitial
        ? FullOverLoading():GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: true,
            markers: bloc.markers,
            initialCameraPosition: bloc.myCurrentLocationCameraPosition!,
            onMapCreated: (GoogleMapController controller) {
              bloc.mapController = controller;

              //mapController!.setMapStyle(mapStyle);
            },
            polylines: bloc.placeDirections != null
                ? {
                    Polyline(
                      polylineId: const PolylineId('my_polyline'),
                      color: Colors.blue,
                      width: 2,
                      points: bloc.polylinePoints,
                    ),
                  }
                : {},
          )
        ;
  }
}
