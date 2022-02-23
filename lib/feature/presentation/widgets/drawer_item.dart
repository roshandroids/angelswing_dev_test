import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///  Drawer Item provider
final drawerItemSettingPro = Provider<DrawerItemSetting?>((ref) => null);

/// Drawer Item tile setting
class DrawerItemSetting {
  const DrawerItemSetting({
    required this.title,
    required this.lat,
    required this.lng,
  });

  ///Drawer Item title
  final String title;

  ///Drawer Item lat
  final String lat;

  ///Drawer Item lng
  final String lng;
}

class DrawerItem extends ConsumerWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(drawerItemSettingPro);

    if (setting == null) {
      throw Exception(
        '''ShowTileSetting cannot be null. Did you forgot to override [showTileSettingPro] provider?''',
      );
    }
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.8),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            setting.title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              text: 'Lat',
              children: [
                TextSpan(
                  text: setting.lat,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              text: 'Long',
              children: [
                TextSpan(
                  text: setting.lng,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
