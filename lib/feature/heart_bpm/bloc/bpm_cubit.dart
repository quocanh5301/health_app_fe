import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/feature/heart_bpm/bloc/bpm_state.dart';
import 'package:health_app_flutter/feature/heart_bpm/repository/bpm_repository.dart';
import 'package:health_app_flutter/util/stress_calculate.dart';

class BPMCubit extends Cubit<BPMState> {
  BPMCubit({
    required this.bpmRepository,
  }) : super(const BPMState());

  BPMRepository bpmRepository;

  void setBPM(int bpm) => emit(
        state.copyWith(
          bpm: bpm,
        ),
      );

  Future<void> saveBPMData() async {
    int stressPercentage = StressCalculator.calculateStressLevelPercentage(
      SharedPref.getUserInfo().userAge ?? 18,
      state.bpm.toInt(),
    ).toInt();

    emit(
      state.copyWith(
        setYouBPMStatus: SetYouBPMStatus.loading,
      ),
    );
    final result = await bpmRepository
        .saveBPMData(
          bpm: state.bpm,
          stressLevel: stressPercentage,
        )
        .run();

    result.match(
      (error) {
        // debugPrint("save bpm data error: $error");
        emit(
          state.copyWith(
            mess: error,
            setYouBPMStatus: SetYouBPMStatus.failure,
          ),
        );
      },
      (response) async {
        // debugPrint("save bpm data response: $response");
        emit(
          state.copyWith(
            setYouBPMStatus: SetYouBPMStatus.success,
            stressLevel: stressPercentage,
            stressDescription:
                StressCalculator.getStressDescription(stressPercentage),
          ),
        );
      },
    );
  }
}
