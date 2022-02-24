// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final markersProvider = ChangeNotifierProvider<MarkersProvider>((ref) {
  return MarkersProvider();
});

class MarkersProvider extends ChangeNotifier {
  Set<Marker> markers = {};
  List<LatLng> listLocations = [];

  late GoogleMapController mapsController;

  void initController(GoogleMapController controller) {
    mapsController = controller;
    notifyListeners();
  }

  void updateMarkersList(Set<Marker> value, List<LatLng> locs) {
    markers = value;
    listLocations = locs;
    notifyListeners();
  }

  void addLocation(LatLng latLng) {
    if (!listLocations.contains(latLng)) {
      listLocations.add(latLng);
      listLocations.toSet().toList();
    }
    notifyListeners();
  }

  void animateCamera(LatLng latLng) {
    mapsController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 16,
        ),
      ),
    );
    notifyListeners();
  }
}
