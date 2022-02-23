import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_response.freezed.dart';
part 'location_response.g.dart';

@freezed
class Locationresponse with _$Locationresponse {
  const factory Locationresponse({
    @Default([<double>[]]) List<List<double>> locations,
  }) = _Locationresponse;

  factory Locationresponse.fromJson(Map<String, dynamic> json) =>
      _$LocationresponseFromJson(json);
}
