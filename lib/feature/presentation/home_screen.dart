import 'package:angelswing_dev_test/feature/presentation/widgets/drawer_item.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/drawer_status_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isOpen = ref.watch(drawerStatusProvider).isOpen;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Angelswing Demo'),
        leading: GestureDetector(
          child: isOpen
              ? const Icon(
                  Icons.chevron_left,
                  size: 35,
                )
              : const Icon(Icons.dehaze),
          onTap: () {
            if (_scaffoldKey.currentState?.isDrawerOpen == false) {
              _scaffoldKey.currentState?.openDrawer();
              ref.read(drawerStatusProvider.notifier).changeStatus(true);
            } else {
              _scaffoldKey.currentState?.openEndDrawer();
              ref.read(drawerStatusProvider.notifier).changeStatus(false);
            }
          },
        ),
      ),
      body: Scaffold(
        onDrawerChanged: (status) =>
            ref.read(drawerStatusProvider.notifier).changeStatus(status),
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Colors.transparent.withOpacity(.1),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, item) {
              return ProviderScope(
                overrides: [
                  drawerItemSettingPro.overrideWithValue(
                      const DrawerItemSetting(
                          title: 'title', lat: 'lat', lng: 'lng')),
                ],
                child: const DrawerItem(),
              );
            },
          ),
        ),
        body: Column(
          children: List.generate(
            10,
            (index) => Text(
              index.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
