// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_heart_rate_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasicHeartRateData _$BasicHeartRateDataFromJson(Map<String, dynamic> json) {
  return _BasicHeartRateData.fromJson(json);
}

/// @nodoc
mixin _$BasicHeartRateData {
// @JsonKey(name: 'id') int? id,
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'measured_at')
  String? get measuredAt =>
      throw _privateConstructorUsedError; //"0,6" km in string form
  @JsonKey(name: 'heart_rate')
  int? get bpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'stress_level')
  int? get stressLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicHeartRateDataCopyWith<BasicHeartRateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicHeartRateDataCopyWith<$Res> {
  factory $BasicHeartRateDataCopyWith(
          BasicHeartRateData value, $Res Function(BasicHeartRateData) then) =
      _$BasicHeartRateDataCopyWithImpl<$Res, BasicHeartRateData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'measured_at') String? measuredAt,
      @JsonKey(name: 'heart_rate') int? bpm,
      @JsonKey(name: 'stress_level') int? stressLevel});
}

/// @nodoc
class _$BasicHeartRateDataCopyWithImpl<$Res, $Val extends BasicHeartRateData>
    implements $BasicHeartRateDataCopyWith<$Res> {
  _$BasicHeartRateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? measuredAt = freezed,
    Object? bpm = freezed,
    Object? stressLevel = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      measuredAt: freezed == measuredAt
          ? _value.measuredAt
          : measuredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      bpm: freezed == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int?,
      stressLevel: freezed == stressLevel
          ? _value.stressLevel
          : stressLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasicHeartRateDataImplCopyWith<$Res>
    implements $BasicHeartRateDataCopyWith<$Res> {
  factory _$$BasicHeartRateDataImplCopyWith(_$BasicHeartRateDataImpl value,
          $Res Function(_$BasicHeartRateDataImpl) then) =
      __$$BasicHeartRateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'measured_at') String? measuredAt,
      @JsonKey(name: 'heart_rate') int? bpm,
      @JsonKey(name: 'stress_level') int? stressLevel});
}

/// @nodoc
class __$$BasicHeartRateDataImplCopyWithImpl<$Res>
    extends _$BasicHeartRateDataCopyWithImpl<$Res, _$BasicHeartRateDataImpl>
    implements _$$BasicHeartRateDataImplCopyWith<$Res> {
  __$$BasicHeartRateDataImplCopyWithImpl(_$BasicHeartRateDataImpl _value,
      $Res Function(_$BasicHeartRateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? measuredAt = freezed,
    Object? bpm = freezed,
    Object? stressLevel = freezed,
  }) {
    return _then(_$BasicHeartRateDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      measuredAt: freezed == measuredAt
          ? _value.measuredAt
          : measuredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      bpm: freezed == bpm
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int?,
      stressLevel: freezed == stressLevel
          ? _value.stressLevel
          : stressLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicHeartRateDataImpl implements _BasicHeartRateData {
  const _$BasicHeartRateDataImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'measured_at') this.measuredAt,
      @JsonKey(name: 'heart_rate') this.bpm,
      @JsonKey(name: 'stress_level') this.stressLevel});

  factory _$BasicHeartRateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicHeartRateDataImplFromJson(json);

// @JsonKey(name: 'id') int? id,
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'measured_at')
  final String? measuredAt;
//"0,6" km in string form
  @override
  @JsonKey(name: 'heart_rate')
  final int? bpm;
  @override
  @JsonKey(name: 'stress_level')
  final int? stressLevel;

  @override
  String toString() {
    return 'BasicHeartRateData(userId: $userId, measuredAt: $measuredAt, bpm: $bpm, stressLevel: $stressLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicHeartRateDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.measuredAt, measuredAt) ||
                other.measuredAt == measuredAt) &&
            (identical(other.bpm, bpm) || other.bpm == bpm) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, measuredAt, bpm, stressLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicHeartRateDataImplCopyWith<_$BasicHeartRateDataImpl> get copyWith =>
      __$$BasicHeartRateDataImplCopyWithImpl<_$BasicHeartRateDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicHeartRateDataImplToJson(
      this,
    );
  }
}

abstract class _BasicHeartRateData implements BasicHeartRateData {
  const factory _BasicHeartRateData(
          {@JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'measured_at') final String? measuredAt,
          @JsonKey(name: 'heart_rate') final int? bpm,
          @JsonKey(name: 'stress_level') final int? stressLevel}) =
      _$BasicHeartRateDataImpl;

  factory _BasicHeartRateData.fromJson(Map<String, dynamic> json) =
      _$BasicHeartRateDataImpl.fromJson;

  @override // @JsonKey(name: 'id') int? id,
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'measured_at')
  String? get measuredAt;
  @override //"0,6" km in string form
  @JsonKey(name: 'heart_rate')
  int? get bpm;
  @override
  @JsonKey(name: 'stress_level')
  int? get stressLevel;
  @override
  @JsonKey(ignore: true)
  _$$BasicHeartRateDataImplCopyWith<_$BasicHeartRateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
