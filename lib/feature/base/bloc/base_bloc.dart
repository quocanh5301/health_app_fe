import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/base/bloc/base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState());

  void changeTab({required int index}) => emit(state.copyWith(tabIndex: index));
}
