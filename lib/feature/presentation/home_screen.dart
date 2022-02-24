import 'package:angelswing_dev_test/core/utils/permission/permission_status_provider.dart';
import 'package:angelswing_dev_test/feature/application/application.dart';
import 'package:angelswing_dev_test/feature/infrastructure/infrastructure.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/drawer_item.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/drawer_status_notifier.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/map_view.dart';
import 'package:angelswing_dev_test/feature/presentation/widgets/markers_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    checkPermission();
    ref.read(getAllLocationController.notifier).getLocations();
  }

  void checkPermission() {
    ref.read(permissionStatusProvider.notifier).checkPermission(context);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      checkPermission();
    }
  }

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
          backgroundColor: Colors.grey.withOpacity(.7),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(getAllLocationController);
              return state.maybeMap(
                loading: (_) => ListView.separated(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  itemCount: 5,
                  separatorBuilder: (context, item) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(.5)),
                      height: 100,
                      width: 100,
                    );
                  },
                ),
                success: (s) {
                  final data = ref.watch(markersProvider).listLocations;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ProviderScope(
                        overrides: [
                          drawerItemSettingPro.overrideWithValue(
                            DrawerItemSetting(
                              title: 'Location ${index + 1}',
                              latLng: item,
                              isLastItem: index == data.length - 1,
                            ),
                          ),
                        ],
                        child: const DrawerItem(),
                      );
                    },
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
        body: const MapView(),
      ),
    );
  }
}
