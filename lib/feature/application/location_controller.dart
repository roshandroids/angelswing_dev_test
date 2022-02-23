import 'package:angelswing_dev_test/core/core.dart';
import 'package:angelswing_dev_test/feature/infrastructure/infrastructure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllLocationController =
    StateNotifierProvider<LocationController, BaseState>(homeController);

LocationController homeController<T>(Ref ref) {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  return LocationController<T>(ref.read, cancelToken: cancelToken);
}

class LocationController<T> extends StateNotifier<BaseState> {
  LocationController(this._read, {this.cancelToken})
      : super(const BaseState<void>.initial());

  final Reader _read;

  ///
  final CancelToken? cancelToken;

  ILocationRepository get _locationRepository =>
      _read(locationRepositoryProvider);

  Future<void> getAllContestants({
    String? keyword,
    bool isActive = true,
    int? skipCount,
    int? maxResultCount,
  }) async {
    state = const BaseState<void>.loading();
    final data = await _locationRepository.getLocations();
    state = data.fold(
      (failure) {
        return BaseState<Failure>.error(failure.reason);
      },
      (data) {
        return BaseState<Locationresponse>.success(data: data);
      },
    );
  }
}
