// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RunTrackState {
  RunData get runData => throw _privateConstructorUsedError;
  RunTrackingStatus get runTrackingStatus => throw _privateConstructorUsedError;
  MyLocationPermission get locationPermission =>
      throw _privateConstructorUsedError;
  PhysicalActivityPermission get physicalActivityPermission =>
      throw _privateConstructorUsedError;
  SaveRunStatus get saveRunStatus => throw _privateConstructorUsedError;
  String get mess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RunTrackStateCopyWith<RunTrackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunTrackStateCopyWith<$Res> {
  factory $RunTrackStateCopyWith(
          RunTrackState value, $Res Function(RunTrackState) then) =
      _$RunTrackStateCopyWithImpl<$Res, RunTrackState>;
  @useResult
  $Res call(
      {RunData runData,
      RunTrackingStatus runTrackingStatus,
      MyLocationPermission locationPermission,
      PhysicalActivityPermission physicalActivityPermission,
      SaveRunStatus saveRunStatus,
      String mess});

  $RunDataCopyWith<$Res> get runData;
}

/// @nodoc
class _$RunTrackStateCopyWithImpl<$Res, $Val extends RunTrackState>
    implements $RunTrackStateCopyWith<$Res> {
  _$RunTrackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runData = null,
    Object? runTrackingStatus = null,
    Object? locationPermission = null,
    Object? physicalActivityPermission = null,
    Object? saveRunStatus = null,
    Object? mess = null,
  }) {
    return _then(_value.copyWith(
      runData: null == runData
          ? _value.runData
          : runData // ignore: cast_nullable_to_non_nullable
              as RunData,
      runTrackingStatus: null == runTrackingStatus
          ? _value.runTrackingStatus
          : runTrackingStatus // ignore: cast_nullable_to_non_nullable
              as RunTrackingStatus,
      locationPermission: null == locationPermission
          ? _value.locationPermission
          : locationPermission // ignore: cast_nullable_to_non_nullable
              as MyLocationPermission,
      physicalActivityPermission: null == physicalActivityPermission
          ? _value.physicalActivityPermission
          : physicalActivityPermission // ignore: cast_nullable_to_non_nullable
              as PhysicalActivityPermission,
      saveRunStatus: null == saveRunStatus
          ? _value.saveRunStatus
          : saveRunStatus // ignore: cast_nullable_to_non_nullable
              as SaveRunStatus,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RunDataCopyWith<$Res> get runData {
    return $RunDataCopyWith<$Res>(_value.runData, (value) {
      return _then(_value.copyWith(runData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RunTrackStateImplCopyWith<$Res>
    implements $RunTrackStateCopyWith<$Res> {
  factory _$$RunTrackStateImplCopyWith(
          _$RunTrackStateImpl value, $Res Function(_$RunTrackStateImpl) then) =
      __$$RunTrackStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RunData runData,
      RunTrackingStatus runTrackingStatus,
      MyLocationPermission locationPermission,
      PhysicalActivityPermission physicalActivityPermission,
      SaveRunStatus saveRunStatus,
      String mess});

  @override
  $RunDataCopyWith<$Res> get runData;
}

/// @nodoc
class __$$RunTrackStateImplCopyWithImpl<$Res>
    extends _$RunTrackStateCopyWithImpl<$Res, _$RunTrackStateImpl>
    implements _$$RunTrackStateImplCopyWith<$Res> {
  __$$RunTrackStateImplCopyWithImpl(
      _$RunTrackStateImpl _value, $Res Function(_$RunTrackStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runData = null,
    Object? runTrackingStatus = null,
    Object? locationPermission = null,
    Object? physicalActivityPermission = null,
    Object? saveRunStatus = null,
    Object? mess = null,
  }) {
    return _then(_$RunTrackStateImpl(
      runData: null == runData
          ? _value.runData
          : runData // ignore: cast_nullable_to_non_nullable
              as RunData,
      runTrackingStatus: null == runTrackingStatus
          ? _value.runTrackingStatus
          : runTrackingStatus // ignore: cast_nullable_to_non_nullable
              as RunTrackingStatus,
      locationPermission: null == locationPermission
          ? _value.locationPermission
          : locationPermission // ignore: cast_nullable_to_non_nullable
              as MyLocationPermission,
      physicalActivityPermission: null == physicalActivityPermission
          ? _value.physicalActivityPermission
          : physicalActivityPermission // ignore: cast_nullable_to_non_nullable
              as PhysicalActivityPermission,
      saveRunStatus: null == saveRunStatus
          ? _value.saveRunStatus
          : saveRunStatus // ignore: cast_nullable_to_non_nullable
              as SaveRunStatus,
      mess: null == mess
          ? _value.mess
          : mess // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RunTrackStateImpl implements _RunTrackState {
  const _$RunTrackStateImpl(
      {this.runData = const RunData(),
      this.runTrackingStatus = RunTrackingStatus.initial,
      this.locationPermission = MyLocationPermission.initial,
      this.physicalActivityPermission = PhysicalActivityPermission.initial,
      this.saveRunStatus = SaveRunStatus.initial,
      this.mess = ""});

  @override
  @JsonKey()
  final RunData runData;
  @override
  @JsonKey()
  final RunTrackingStatus runTrackingStatus;
  @override
  @JsonKey()
  final MyLocationPermission locationPermission;
  @override
  @JsonKey()
  final PhysicalActivityPermission physicalActivityPermission;
  @override
  @JsonKey()
  final SaveRunStatus saveRunStatus;
  @override
  @JsonKey()
  final String mess;

  @override
  String toString() {
    return 'RunTrackState(runData: $runData, runTrackingStatus: $runTrackingStatus, locationPermission: $locationPermission, physicalActivityPermission: $physicalActivityPermission, saveRunStatus: $saveRunStatus, mess: $mess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunTrackStateImpl &&
            (identical(other.runData, runData) || other.runData == runData) &&
            (identical(other.runTrackingStatus, runTrackingStatus) ||
                other.runTrackingStatus == runTrackingStatus) &&
            (identical(other.locationPermission, locationPermission) ||
                other.locationPermission == locationPermission) &&
            (identical(other.physicalActivityPermission,
                    physicalActivityPermission) ||
                other.physicalActivityPermission ==
                    physicalActivityPermission) &&
            (identical(other.saveRunStatus, saveRunStatus) ||
                other.saveRunStatus == saveRunStatus) &&
            (identical(other.mess, mess) || other.mess == mess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, runData, runTrackingStatus,
      locationPermission, physicalActivityPermission, saveRunStatus, mess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunTrackStateImplCopyWith<_$RunTrackStateImpl> get copyWith =>
      __$$RunTrackStateImplCopyWithImpl<_$RunTrackStateImpl>(this, _$identity);
}

abstract class _RunTrackState implements RunTrackState {
  const factory _RunTrackState(
      {final RunData runData,
      final RunTrackingStatus runTrackingStatus,
      final MyLocationPermission locationPermission,
      final PhysicalActivityPermission physicalActivityPermission,
      final SaveRunStatus saveRunStatus,
      final String mess}) = _$RunTrackStateImpl;

  @override
  RunData get runData;
  @override
  RunTrackingStatus get runTrackingStatus;
  @override
  MyLocationPermission get locationPermission;
  @override
  PhysicalActivityPermission get physicalActivityPermission;
  @override
  SaveRunStatus get saveRunStatus;
  @override
  String get mess;
  @override
  @JsonKey(ignore: true)
  _$$RunTrackStateImplCopyWith<_$RunTrackStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
