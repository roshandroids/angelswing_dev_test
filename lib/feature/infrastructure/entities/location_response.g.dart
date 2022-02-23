// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Locationresponse _$$_LocationresponseFromJson(Map<String, dynamic> json) =>
    _$_Locationresponse(
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LocationresponseToJson(_$_Locationresponse instance) =>
    <String, dynamic>{
      'locations': instance.locations,
    };
