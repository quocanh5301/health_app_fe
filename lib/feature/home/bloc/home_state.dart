import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/basic_heart_rate_data.dart';
import 'package:health_app_flutter/data/model/basic_run_data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String mess,
    @Default(200) int code,
    @Default([]) List<BasicRunData> lastWeekRunDatas,
    @Default([]) List<BasicRunData> thisWeekRunDatas,
    @Default([]) List<BasicHeartRateData> myBPMDatas,
    @Default(GetYourDataStatus.initial) GetYourDataStatus getYourDataStatus,
  }) = _HomeState;
}

enum GetYourDataStatus { initial, loading, success, failure }
