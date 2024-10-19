// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RunData _$RunDataFromJson(Map<String, dynamic> json) {
  return _RunData.fromJson(json);
}

/// @nodoc
mixin _$RunData {
  double get distanceTraveled => throw _privateConstructorUsedError;
  int get stepsCount => throw _privateConstructorUsedError;
  Duration get timePassed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunDataCopyWith<RunData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunDataCopyWith<$Res> {
  factory $RunDataCopyWith(RunData value, $Res Function(RunData) then) =
      _$RunDataCopyWithImpl<$Res, RunData>;
  @useResult
  $Res call({double distanceTraveled, int stepsCount, Duration timePassed});
}

/// @nodoc
class _$RunDataCopyWithImpl<$Res, $Val extends RunData>
    implements $RunDataCopyWith<$Res> {
  _$RunDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceTraveled = null,
    Object? stepsCount = null,
    Object? timePassed = null,
  }) {
    return _then(_value.copyWith(
      distanceTraveled: null == distanceTraveled
          ? _value.distanceTraveled
          : distanceTraveled // ignore: cast_nullable_to_non_nullable
              as double,
      stepsCount: null == stepsCount
          ? _value.stepsCount
          : stepsCount // ignore: cast_nullable_to_non_nullable
              as int,
      timePassed: null == timePassed
          ? _value.timePassed
          : timePassed // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RunDataImplCopyWith<$Res> implements $RunDataCopyWith<$Res> {
  factory _$$RunDataImplCopyWith(
          _$RunDataImpl value, $Res Function(_$RunDataImpl) then) =
      __$$RunDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double distanceTraveled, int stepsCount, Duration timePassed});
}

/// @nodoc
class __$$RunDataImplCopyWithImpl<$Res>
    extends _$RunDataCopyWithImpl<$Res, _$RunDataImpl>
    implements _$$RunDataImplCopyWith<$Res> {
  __$$RunDataImplCopyWithImpl(
      _$RunDataImpl _value, $Res Function(_$RunDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceTraveled = null,
    Object? stepsCount = null,
    Object? timePassed = null,
  }) {
    return _then(_$RunDataImpl(
      distanceTraveled: null == distanceTraveled
          ? _value.distanceTraveled
          : distanceTraveled // ignore: cast_nullable_to_non_nullable
              as double,
      stepsCount: null == stepsCount
          ? _value.stepsCount
          : stepsCount // ignore: cast_nullable_to_non_nullable
              as int,
      timePassed: null == timePassed
          ? _value.timePassed
          : timePassed // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunDataImpl implements _RunData {
  const _$RunDataImpl(
      {this.distanceTraveled = 0,
      this.stepsCount = 0,
      this.timePassed = Duration.zero});

  factory _$RunDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunDataImplFromJson(json);

  @override
  @JsonKey()
  final double distanceTraveled;
  @override
  @JsonKey()
  final int stepsCount;
  @override
  @JsonKey()
  final Duration timePassed;

  @override
  String toString() {
    return 'RunData(distanceTraveled: $distanceTraveled, stepsCount: $stepsCount, timePassed: $timePassed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunDataImpl &&
            (identical(other.distanceTraveled, distanceTraveled) ||
                other.distanceTraveled == distanceTraveled) &&
            (identical(other.stepsCount, stepsCount) ||
                other.stepsCount == stepsCount) &&
            (identical(other.timePassed, timePassed) ||
                other.timePassed == timePassed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, distanceTraveled, stepsCount, timePassed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunDataImplCopyWith<_$RunDataImpl> get copyWith =>
      __$$RunDataImplCopyWithImpl<_$RunDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunDataImplToJson(
      this,
    );
  }
}

abstract class _RunData implements RunData {
  const factory _RunData(
      {final double distanceTraveled,
      final int stepsCount,
      final Duration timePassed}) = _$RunDataImpl;

  factory _RunData.fromJson(Map<String, dynamic> json) = _$RunDataImpl.fromJson;

  @override
  double get distanceTraveled;
  @override
  int get stepsCount;
  @override
  Duration get timePassed;
  @override
  @JsonKey(ignore: true)
  _$$RunDataImplCopyWith<_$RunDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
