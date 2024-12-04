import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/run_data.dart';

part 'run_tracking_state.freezed.dart';

@freezed
class RunTrackState with _$RunTrackState {
  const factory RunTrackState({
    @Default(RunData()) RunData runData,
    @Default(RunTrackingStatus.initial) RunTrackingStatus runTrackingStatus,
    @Default(MyLocationPermission.initial) MyLocationPermission locationPermission,
    @Default(PhysicalActivityPermission.initial)
    PhysicalActivityPermission physicalActivityPermission,
    @Default(SaveRunStatus.initial) SaveRunStatus saveRunStatus,
    @Default("") String mess,
    @Default(0) double distance,
    @Default(0) int stepsCount,
    @Default(0) int duration, //in seconds
  }) = _RunTrackState;
}

enum RunTrackingStatus { initial, tracking, finish, error }

enum MyLocationPermission { initial, denied, allowed, deniedForever }

enum PhysicalActivityPermission { initial, denied, allowed, deniedForever }

enum SaveRunStatus { initial, loading, finish, error }
