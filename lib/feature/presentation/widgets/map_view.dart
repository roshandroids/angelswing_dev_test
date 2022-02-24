import 'package:angelswing_dev_test/core/utils/consts.dart';
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
  late GoogleMapController mapsController;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final markers = ref.watch(markersProvider).markers;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          GestureDetector(
            onTap: () async {
              final position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              final marker = Marker(
                markerId: MarkerId('${position.latitude},${position.latitude}'),
                position: LatLng(position.latitude, position.longitude),
              );
              final newMarkers = markers..add(marker);
              ref.read(markersProvider.notifier).updateMarkersList(newMarkers);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff193968),
              ),
              child: const Icon(
                Entypo.location_pin,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () async {
              final position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              await mapsController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 16,
                ),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff193968),
              ),
              child: const Icon(
                Ionicons.ios_navigate,
                color: Colors.white,
                size: 20,
              ),
            ),
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
            onMapCreated: (GoogleMapController controller) {
              mapsController = controller;
            },
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        0xff3F4447,
                      ),
                    ),
                    child: const Icon(
                      Entypo.plus,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (mapsController != null) {
                      var currentZoomLevel =
                          await mapsController.getZoomLevel();
                      // final coord = await mapsController!.getVisibleRegion();

                      currentZoomLevel = currentZoomLevel + 2;
                      // await mapsController!.animateCamera(
                      //   CameraUpdate.newCameraPosition(
                      //     CameraPosition(
                      //       target: LatLng(coord.),
                      //       zoom: currentZoomLevel,
                      //     ),
                      //   ),
                      // );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        0xff3F4447,
                      ),
                    ),
                    child: const Icon(
                      Entypo.minus,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
