// ignore_for_file: avoid_void_async

import 'package:angelswing_dev_test/core/utils/consts.dart';
import 'package:angelswing_dev_test/core/utils/permission/permission_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final permissionStatusProvider =
    ChangeNotifierProvider<PermissionStatusProvider>((ref) {
  return PermissionStatusProvider();
});

class PermissionStatusProvider extends ChangeNotifier {
  bool hasPermission = false;
  Position? position;
  CameraPosition currentPosition = const CameraPosition(
    zoom: 16,
    target: initialLocation,
  );

  void checkPermission(BuildContext context) async {
    final status = await PermissionChecker.hasLocationPermission(context);

    hasPermission = status;
    notifyListeners();
  }

  Future<Position?> getLocation(BuildContext context) async {
    final status = await PermissionChecker.hasLocationPermission(context);
    if (status) {
      final loc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      position = loc;
      currentPosition =
          CameraPosition(target: LatLng(loc.latitude, loc.longitude), zoom: 16);
      notifyListeners();
      return position;
    } else {
      return null;
    }
  }

  void updateFocus(CameraPosition position) async {
    currentPosition = position;
    notifyListeners();
  }
}
