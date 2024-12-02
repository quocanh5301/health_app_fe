import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:health_app_flutter/data/model/run_data.dart';
import 'package:health_app_flutter/feature/run_tracking/bloc/run_tracking_state.dart';
import 'package:health_app_flutter/util/service/location.dart';
import 'package:health_app_flutter/util/service/permission.dart';
import 'package:health_app_flutter/util/service/step.dart';
import 'package:health_app_flutter/util/service/time.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class RunTrackCubit extends Cubit<RunTrackState> {
  final LocationTrackingService _locationService = LocationTrackingService();
  final StepTrackingService _stepService = StepTrackingService();
  final TimeTrackingService _timeService = TimeTrackingService();
  final LocationPermissionService _locationPermissionService =
      LocationPermissionService();
  final PhysicalActivityPermissionService _activityPermissionService =
      PhysicalActivityPermissionService();

  RunTrackCubit() : super(const RunTrackState());

  Stream<Position>? _positionStream;
  Stream<StepCount>? _stepStream;
  StreamSubscription? _positionAndStepStreamSubscription;
  Position? _lastPosition;
  int _startStep = 0;
  bool _isFirstStep = true;

  Future<void> permissionsHandling() async {
    final locationPermission =
        await _locationPermissionService.requestPermission();
    final activityPermission =
        await _activityPermissionService.requestPermission();

    if (locationPermission == PermissionStatus.denied) {
      emit(state.copyWith(
        locationPermission: MyLocationPermission.denied,
        physicalActivityPermission: state.physicalActivityPermission,
      ));
    } else if (locationPermission == PermissionStatus.permanentlyDenied) {
      emit(state.copyWith(
        locationPermission: MyLocationPermission.deniedForever,
        physicalActivityPermission: state.physicalActivityPermission,
      ));
    } else{
      emit(state.copyWith(
        locationPermission: MyLocationPermission.allowed,
        physicalActivityPermission: state.physicalActivityPermission,
      ));
    }
    
    if (activityPermission == PermissionStatus.denied) {
        emit(state.copyWith(
          locationPermission: state.locationPermission,
          physicalActivityPermission: PhysicalActivityPermission.denied,
        ));
      } else if (activityPermission == PermissionStatus.permanentlyDenied) {
        emit(state.copyWith(
          locationPermission: state.locationPermission,
          physicalActivityPermission: PhysicalActivityPermission.deniedForever,
        ));
      } else {
        emit(state.copyWith(
          locationPermission: state.locationPermission,
          physicalActivityPermission: PhysicalActivityPermission.allowed,
        ));
      }
  }

  Future<void> onStartTracking() async {
    try {
      emit(state.copyWith(
        runTrackingStatus: RunTrackingStatus.tracking,
        mess: '',
      ));
      _positionStream = _locationService.startLocationTracking();
      _stepStream = _stepService.startStepTracking();

      if (_positionStream != null && _stepStream != null) {
        _combinePositionAndStepStreams();
        _timeService.startCountdown(() {
          emit(
            state.copyWith(
              runData: state.runData.copyWith(
                distanceTraveled: state.runData.distanceTraveled,
                stepsCount: state.runData.stepsCount,
                timePassed:
                    state.runData.timePassed + const Duration(seconds: 1),
              ),
            ),
          );
        });
      }
    } catch (e) {
      emit(state.copyWith(
        runTrackingStatus: RunTrackingStatus.error,
        mess: e.toString(),
      ));
    }
  }

  void onStopTracking() {
    _positionAndStepStreamSubscription?.cancel();
    _timeService.stopCountdown();
    emit(state.copyWith(
      runTrackingStatus: RunTrackingStatus.finish,
      mess: '',
    ));
  }

  void _combinePositionAndStepStreams() {
    final combinedStream = Rx.combineLatest2(
      _positionStream!,
      _stepStream!,
      (Position position, StepCount stepCount) {
        if (_isFirstStep) {
          _startStep = stepCount.steps;
          _isFirstStep = false;
        }

        _lastPosition ??= position;
        final distance = Geolocator.distanceBetween(
          _lastPosition!.latitude,
          _lastPosition!.longitude,
          position.latitude,
          position.longitude,
        );
        debugPrint('Distance: $distance');

        emit(state.copyWith(
          runData: RunData(
            distanceTraveled: state.runData.distanceTraveled + distance,
            stepsCount: stepCount.steps - _startStep,
            timePassed: state.runData.timePassed,
          ),
        ));
        _lastPosition = position;
        return [position, stepCount];
      },
    );

    _positionAndStepStreamSubscription = combinedStream.listen((event) {
      // Optionally, handle stream events here
      debugPrint('Stream ${event[0]}');
    });
  }
}
