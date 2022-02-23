import 'package:angelswing_dev_test/core/core.dart';
import 'package:angelswing_dev_test/feature/infrastructure/infrastructure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationRepositoryProvider = Provider<ILocationRepository>((ref) {
  return LocationRepository();
});

abstract class ILocationRepository {
  Future<Either<Failure, Locationresponse>> getLocations();
}
