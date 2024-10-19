import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/first_intro/bloc/first_intro_state.dart';

class FirstIntroCubit extends Cubit<FirstIntroState> {
  FirstIntroCubit() : super(const FirstIntroState());

  void changeTab({required int index}) => emit(state.copyWith(tabIndex: index));
}
