import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/home/bloc/home_cubit.dart';
import 'package:health_app_flutter/feature/home/bloc/home_state.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<HomeCubit>()
          ..getMyRunData()
          ..getMyHeartData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              previous.getYourDataStatus != current.getYourDataStatus ||
              previous.lastWeekRunDatas != current.lastWeekRunDatas ||
              previous.myBPMDatas != current.myBPMDatas ||
              previous.thisWeekRunDatas != current.thisWeekRunDatas ||
              previous.myBPMDatas != current.myBPMDatas,
          builder: (context, state) {
            return Column(
              children: [
                Text("dataaaaaaaaaaa + ${state.getYourDataStatus}"),
                Text(state.lastWeekRunDatas.toString()),
                const VerticalSpace(30),
                Text(state.myBPMDatas.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
