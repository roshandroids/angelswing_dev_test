import 'package:angelswing_dev_test/core/utils/consts.dart';
import 'package:angelswing_dev_test/core/utils/permission/permission_status_provider.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/custom_icon_button.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/markers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  @override
  Widget build(BuildContext context) {
    final markerPro = ref.watch(markersProvider);
    final markers = ref.watch(markersProvider).markers;
    final currentFocus = ref.watch(permissionStatusProvider).currentPosition;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          CustomIconButton(
            onTap: () async {
              final position = await ref
                  .read(permissionStatusProvider.notifier)
                  .getLocation(context);
              if (position != null) {
                final marker = Marker(
                  infoWindow: InfoWindow(
                      title: '${position.latitude},${position.longitude}'),
                  markerId:
                      MarkerId('${position.latitude},${position.latitude}'),
                  position: LatLng(position.latitude, position.longitude),
                );
                final newMarkers = markerPro.markers..add(marker);
                ref
                    .read(markersProvider.notifier)
                    .updateMarkersList(newMarkers, markerPro.listLocations);
                ref
                    .read(markersProvider.notifier)
                    .addLocation(LatLng(position.latitude, position.longitude));
              }
            },
            icon: const Icon(
              Entypo.location_pin,
              color: Colors.white,
            ),
            color: const Color(0xff0600EE),
          ),
          const Spacer(flex: 2),
          CustomIconButton(
            onTap: () async {
              final position = await ref
                  .read(permissionStatusProvider.notifier)
                  .getLocation(context);
              if (position != null) {
                final position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                ref.read(markersProvider.notifier).animateCamera(
                    LatLng(position.latitude, position.longitude));
              }
            },
            icon: const Icon(
              Ionicons.ios_navigate,
              color: Colors.white,
              size: 20,
            ),
            color: const Color(0xff193968),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: const CameraPosition(
              zoom: 16,
              target: initialLocation,
            ),
            onTap: (latLng) {},
            zoomControlsEnabled: false,
            markers: markers,
            onMapCreated: (controller) =>
                ref.read(markersProvider.notifier).initController(controller),
            onCameraMove: (CameraPosition position) => ref
                .read(permissionStatusProvider.notifier)
                .updateFocus(position),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Column(
              children: [
                CustomIconButton(
                  onTap: () async {
                    final _mapController =
                        ref.read(markersProvider).mapsController;

                    final currentZoomLevel =
                        await _mapController.getZoomLevel();

                    /// Update camera position with new location data
                    await _mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: currentFocus.target,
                          zoom: currentZoomLevel + .5,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Entypo.plus, color: Colors.white),
                  color: const Color(
                    0xff3F4447,
                  ),
                ),
                const SizedBox(height: 20),
                CustomIconButton(
                  onTap: () async {
                    final _mapController =
                        ref.read(markersProvider).mapsController;

                    final currentZoomLevel =
                        await _mapController.getZoomLevel();

                    await _mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: currentFocus.target,
                          zoom: currentZoomLevel - .5,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Entypo.minus, color: Colors.white),
                  color: const Color(0xff3F4447),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
