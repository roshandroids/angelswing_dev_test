// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Locationresponse _$LocationresponseFromJson(Map<String, dynamic> json) {
  return _Locationresponse.fromJson(json);
}

/// @nodoc
class _$LocationresponseTearOff {
  const _$LocationresponseTearOff();

  _Locationresponse call({List<List<double>> locations = const []}) {
    return _Locationresponse(
      locations: locations,
    );
  }

  Locationresponse fromJson(Map<String, Object?> json) {
    return Locationresponse.fromJson(json);
  }
}

/// @nodoc
const $Locationresponse = _$LocationresponseTearOff();

/// @nodoc
mixin _$Locationresponse {
  List<List<double>> get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationresponseCopyWith<Locationresponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationresponseCopyWith<$Res> {
  factory $LocationresponseCopyWith(
          Locationresponse value, $Res Function(Locationresponse) then) =
      _$LocationresponseCopyWithImpl<$Res>;
  $Res call({List<List<double>> locations});
}

/// @nodoc
class _$LocationresponseCopyWithImpl<$Res>
    implements $LocationresponseCopyWith<$Res> {
  _$LocationresponseCopyWithImpl(this._value, this._then);

  final Locationresponse _value;
  // ignore: unused_field
  final $Res Function(Locationresponse) _then;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
abstract class _$LocationresponseCopyWith<$Res>
    implements $LocationresponseCopyWith<$Res> {
  factory _$LocationresponseCopyWith(
          _Locationresponse value, $Res Function(_Locationresponse) then) =
      __$LocationresponseCopyWithImpl<$Res>;
  @override
  $Res call({List<List<double>> locations});
}

/// @nodoc
class __$LocationresponseCopyWithImpl<$Res>
    extends _$LocationresponseCopyWithImpl<$Res>
    implements _$LocationresponseCopyWith<$Res> {
  __$LocationresponseCopyWithImpl(
      _Locationresponse _value, $Res Function(_Locationresponse) _then)
      : super(_value, (v) => _then(v as _Locationresponse));

  @override
  _Locationresponse get _value => super._value as _Locationresponse;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_Locationresponse(
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Locationresponse implements _Locationresponse {
  const _$_Locationresponse({this.locations = const []});

  factory _$_Locationresponse.fromJson(Map<String, dynamic> json) =>
      _$$_LocationresponseFromJson(json);

  @JsonKey()
  @override
  final List<List<double>> locations;

  @override
  String toString() {
    return 'Locationresponse(locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Locationresponse &&
            const DeepCollectionEquality().equals(other.locations, locations));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locations));

  @JsonKey(ignore: true)
  @override
  _$LocationresponseCopyWith<_Locationresponse> get copyWith =>
      __$LocationresponseCopyWithImpl<_Locationresponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationresponseToJson(this);
  }
}

abstract class _Locationresponse implements Locationresponse {
  const factory _Locationresponse({List<List<double>> locations}) =
      _$_Locationresponse;

  factory _Locationresponse.fromJson(Map<String, dynamic> json) =
      _$_Locationresponse.fromJson;

  @override
  List<List<double>> get locations;
  @override
  @JsonKey(ignore: true)
  _$LocationresponseCopyWith<_Locationresponse> get copyWith =>
      throw _privateConstructorUsedError;
}
