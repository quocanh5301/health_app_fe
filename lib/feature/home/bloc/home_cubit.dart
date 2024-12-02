import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/home/bloc/home_state.dart';
import 'package:health_app_flutter/feature/home/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.homeRepository,
  }) : super(const HomeState());

  HomeRepository homeRepository;

  Future<void> getMyRunData() async {
    emit(
      state.copyWith(
        getYourDataStatus: GetYourDataStatus.loading,
      ),
    );
    final result = await homeRepository.getMyRunData().run();

    result.match(
      (error) => emit(
        state.copyWith(
          mess: error,
          getYourDataStatus: GetYourDataStatus.failure,
        ),
      ),
      (response) async {
        emit(
          state.copyWith(
            getYourDataStatus: GetYourDataStatus.success,
            thisWeekRunDatas: response['current'] ?? state.thisWeekRunDatas,
            lastWeekRunDatas: response['previous'] ?? state.lastWeekRunDatas,
          ),
        );
      },
    );
  }

  Future<void> getMyHeartData() async {
    emit(
      state.copyWith(
        getYourDataStatus: GetYourDataStatus.loading,
      ),
    );
    final result = await homeRepository.getMyHeartRate().run();

    result.match(
      (error) => emit(
        state.copyWith(
          mess: error,
          getYourDataStatus: GetYourDataStatus.failure,
        ),
      ),
      (response) async {
        emit(
          state.copyWith(
            getYourDataStatus: GetYourDataStatus.success,
            myBPMDatas: response ?? state.myBPMDatas,
          ),
        );
      },
    );
  }
}
