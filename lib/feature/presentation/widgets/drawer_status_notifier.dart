import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final drawerStatusProvider =
    ChangeNotifierProvider<DrawerNotifierProvider>((ref) {
  return DrawerNotifierProvider();
});

class DrawerNotifierProvider extends ChangeNotifier {
  bool isOpen = false;

  void changeStatus(bool status) {
    isOpen = status;
    notifyListeners();
  }
}
