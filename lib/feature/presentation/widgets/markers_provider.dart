import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final markersProvider = ChangeNotifierProvider<MarkersProvider>((ref) {
  return MarkersProvider();
});

class MarkersProvider extends ChangeNotifier {
  Set<Marker> markers = {};

  void updateMarkersList(Set<Marker> value) {
    markers = value;
    notifyListeners();
  }
}
