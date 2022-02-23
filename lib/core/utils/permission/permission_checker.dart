import 'dart:async';
import 'dart:io';

import 'package:angelswing_dev_test/core/utils/permission/permission_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionChecker {
  static Future<bool> hasLocationPermission(BuildContext context) async {
    var status = await Permission.location.request();

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.location.shouldShowRequestRationale;

        if (!show) {
          PermissionDialog(
            context: context,
          );
        } else {
          await Permission.location.request();
          status = await Permission.location.status;
        }
      } else if (Platform.isIOS) {
        status = await Permission.location.request();
        if (status.isDenied) {
          PermissionDialog(
            context: context,
          );
        }
      } else {
        PermissionDialog(
          context: context,
        );
      }
    } else if (status.isPermanentlyDenied ||
        status.isRestricted ||
        status.isLimited) {
      PermissionDialog(
        context: context,
      );
    }
    return status.isGranted;
  }
}
