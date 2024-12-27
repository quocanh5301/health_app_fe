// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_run_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasicRunData _$BasicRunDataFromJson(Map<String, dynamic> json) {
  return _BasicRunData.fromJson(json);
}

/// @nodoc
mixin _$BasicRunData {
  @JsonKey(name: 'run_date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_distance')
  String? get distance =>
      throw _privateConstructorUsedError; //"0,6" km in string form
  @JsonKey(name: 'total_steps')
  int? get steps => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_duration')
  int? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicRunDataCopyWith<BasicRunData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicRunDataCopyWith<$Res> {
  factory $BasicRunDataCopyWith(
          BasicRunData value, $Res Function(BasicRunData) then) =
      _$BasicRunDataCopyWithImpl<$Res, BasicRunData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'run_date') String? date,
      @JsonKey(name: 'total_distance') String? distance,
      @JsonKey(name: 'total_steps') int? steps,
      @JsonKey(name: 'total_duration') int? duration});
}

/// @nodoc
class _$BasicRunDataCopyWithImpl<$Res, $Val extends BasicRunData>
    implements $BasicRunDataCopyWith<$Res> {
  _$BasicRunDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? distance = freezed,
    Object? steps = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasicRunDataImplCopyWith<$Res>
    implements $BasicRunDataCopyWith<$Res> {
  factory _$$BasicRunDataImplCopyWith(
          _$BasicRunDataImpl value, $Res Function(_$BasicRunDataImpl) then) =
      __$$BasicRunDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'run_date') String? date,
      @JsonKey(name: 'total_distance') String? distance,
      @JsonKey(name: 'total_steps') int? steps,
      @JsonKey(name: 'total_duration') int? duration});
}

/// @nodoc
class __$$BasicRunDataImplCopyWithImpl<$Res>
    extends _$BasicRunDataCopyWithImpl<$Res, _$BasicRunDataImpl>
    implements _$$BasicRunDataImplCopyWith<$Res> {
  __$$BasicRunDataImplCopyWithImpl(
      _$BasicRunDataImpl _value, $Res Function(_$BasicRunDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? distance = freezed,
    Object? steps = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$BasicRunDataImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicRunDataImpl implements _BasicRunData {
  const _$BasicRunDataImpl(
      {@JsonKey(name: 'run_date') this.date,
      @JsonKey(name: 'total_distance') this.distance,
      @JsonKey(name: 'total_steps') this.steps,
      @JsonKey(name: 'total_duration') this.duration});

  factory _$BasicRunDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicRunDataImplFromJson(json);

  @override
  @JsonKey(name: 'run_date')
  final String? date;
  @override
  @JsonKey(name: 'total_distance')
  final String? distance;
//"0,6" km in string form
  @override
  @JsonKey(name: 'total_steps')
  final int? steps;
  @override
  @JsonKey(name: 'total_duration')
  final int? duration;

  @override
  String toString() {
    return 'BasicRunData(date: $date, distance: $distance, steps: $steps, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicRunDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, distance, steps, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicRunDataImplCopyWith<_$BasicRunDataImpl> get copyWith =>
      __$$BasicRunDataImplCopyWithImpl<_$BasicRunDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicRunDataImplToJson(
      this,
    );
  }
}

abstract class _BasicRunData implements BasicRunData {
  const factory _BasicRunData(
          {@JsonKey(name: 'run_date') final String? date,
          @JsonKey(name: 'total_distance') final String? distance,
          @JsonKey(name: 'total_steps') final int? steps,
          @JsonKey(name: 'total_duration') final int? duration}) =
      _$BasicRunDataImpl;

  factory _BasicRunData.fromJson(Map<String, dynamic> json) =
      _$BasicRunDataImpl.fromJson;

  @override
  @JsonKey(name: 'run_date')
  String? get date;
  @override
  @JsonKey(name: 'total_distance')
  String? get distance;
  @override //"0,6" km in string form
  @JsonKey(name: 'total_steps')
  int? get steps;
  @override
  @JsonKey(name: 'total_duration')
  int? get duration;
  @override
  @JsonKey(ignore: true)
  _$$BasicRunDataImplCopyWith<_$BasicRunDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
