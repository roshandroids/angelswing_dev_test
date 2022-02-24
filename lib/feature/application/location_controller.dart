import 'package:angelswing_dev_test/core/core.dart';
import 'package:angelswing_dev_test/feature/infrastructure/infrastructure.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/markers_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final getAllLocationController =
    StateNotifierProvider<LocationController, BaseState>(locationController);

LocationController locationController<T>(Ref ref) {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  return LocationController<T>(ref.read, cancelToken: cancelToken);
}

class LocationController<T> extends StateNotifier<BaseState> {
  LocationController(this._read, {this.cancelToken})
      : super(const BaseState<void>.initial());

  final Reader _read;

  ///
  final CancelToken? cancelToken;

  ILocationRepository get _locationRepository =>
      _read(locationRepositoryProvider);
  MarkersProvider get _markersProvider => _read(markersProvider);

  Future<void> getLocations() async {
    state = const BaseState<void>.loading();
    final data = await _locationRepository.getLocations();
    state = data.fold(
      (failure) {
        return BaseState<Failure>.error(failure.reason);
      },
      (data) {
        final latLngList =
            data.locations.map((e) => LatLng(e[0], e[1])).toList();
        final markers = data.locations
            .map(
              (e) => Marker(
                markerId: MarkerId('${e[0]},${e[1]}'),
                position: LatLng(e[0], e[1]),
              ),
            )
            .toSet();
        _markersProvider.updateMarkersList(markers, latLngList);

        return BaseState<List<LatLng>>.success(data: latLngList);
      },
    );
  }
}
