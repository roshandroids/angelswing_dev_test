// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:angelswing_dev_test/feature/presentation/widgets/markers_provider.dart';

///  Drawer Item provider
final drawerItemSettingPro = Provider<DrawerItemSetting?>((ref) => null);

/// Drawer Item tile setting
class DrawerItemSetting {
  const DrawerItemSetting({
    required this.title,
    required this.latLng,
    required this.isLastItem,
  });

  ///Drawer Item title
  final String title;

  /// Lat & Long
  final LatLng latLng;

  final bool isLastItem;
}

class DrawerItem extends ConsumerWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(drawerItemSettingPro);

    if (setting == null) {
      throw Exception(
        '''DrawerTileSetting cannot be null. Did you forgot to override [drawerItemSettingPro] provider?''',
      );
    }
    return InkWell(
      onTap: () {
        ref.read(markersProvider.notifier).animateCamera(setting.latLng);
        Navigator.of(context).pop();
      },
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: setting.isLastItem
                  ? Colors.blue[100]
                  : Colors.grey.withOpacity(.3),
              borderRadius: BorderRadius.circular(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                setting.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  text: 'Lat  ',
                  children: [
                    TextSpan(
                      text:
                          '${setting.latLng.latitude.toString()} ${setting.isLastItem ? '(marker long)' : ''}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Long  ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text:
                          "${setting.latLng.longitude.toString()} ${setting.isLastItem ? '(marker long)' : ''}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
