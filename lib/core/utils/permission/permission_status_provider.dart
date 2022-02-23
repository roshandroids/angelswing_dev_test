// ignore_for_file: avoid_void_async

import 'package:angelswing_dev_test/core/utils/permission/permission_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final permissionStatusProvider =
    ChangeNotifierProvider<PermissionStatusProvider>((ref) {
  return PermissionStatusProvider();
});

class PermissionStatusProvider extends ChangeNotifier {
  bool hasPermission = false;

  void checkPermission(BuildContext context) async {
    final status = await PermissionChecker.hasLocationPermission(context);
    hasPermission = status;
    notifyListeners();
  }
}
