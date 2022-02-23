import 'dart:async';
import 'package:angelswing_dev_test/core/core.dart';
import 'package:angelswing_dev_test/feature/infrastructure/infrastructure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ContestantsEp {
  static const getAllContestant = '/api/services/app/Contestant/GetAll';
}

class LocationRepository implements ILocationRepository {
  LocationRepository({CancelToken? cancelToken}) : _cancelToken = cancelToken;

  ///
  final CancelToken? _cancelToken;
  final _dio = Dio();

  @override
  Future<Either<Failure, Locationresponse>> getLocations() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
          'https://angelswing-frontend-test-serverless-api.vercel.app/api/locations',
          cancelToken: _cancelToken);
      final result = Locationresponse.fromJson(response.data!);
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
