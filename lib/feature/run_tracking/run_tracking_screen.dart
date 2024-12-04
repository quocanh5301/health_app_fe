import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/run_tracking/bloc/run_tracking_cubit.dart';
import 'package:health_app_flutter/feature/run_tracking/bloc/run_tracking_state.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';

class RunTrackingScreen extends StatelessWidget {
  const RunTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RunTrackCubit>()..permissionsHandling(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fitness Tracker",
            style: AppStyles.f18m().copyWith(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<RunTrackCubit, RunTrackState>(
          listenWhen: (previous, current) =>
              current.locationPermission == previous.locationPermission ||
              current.physicalActivityPermission ==
                  previous.physicalActivityPermission,
          listener: (context, state) {
            if (state.locationPermission == MyLocationPermission.denied ||
                state.physicalActivityPermission ==
                    PhysicalActivityPermission.denied) {
              const BaseRoute().push(context); //!qa
            } else if (state.locationPermission ==
                    MyLocationPermission.deniedForever ||
                state.physicalActivityPermission ==
                    PhysicalActivityPermission.deniedForever) {
              debugPrint("Denied forever");
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                    const SnackBar(
                      content: Text(
                          "Please enable location and activity tracking from your device settings"),
                    ),
                  )
                  .closed
                  .then((value) => const BaseRoute().push(context));
            }
          },
          buildWhen: (previous, current) =>
              previous.runTrackingStatus != current.runTrackingStatus ||
              previous.saveRunStatus != current.saveRunStatus,
          builder: (context, state) {
            return Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Distance Traveled: ${state.runData.distanceTraveled} meters",
                        style: AppStyles.f16m().copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const VerticalSpace(15),
                      Text(
                        "Step Count: ${state.runData.stepsCount.toStringAsFixed(2)}",
                        style: AppStyles.f16m().copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const VerticalSpace(15),
                      Text(
                        "Time Passed: ${state.runData.timePassed.inSeconds} seconds",
                        style: AppStyles.f16m().copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const VerticalSpace(30),
                      ElevatedButton(
                        onPressed: () => (state.runTrackingStatus ==
                                RunTrackingStatus.tracking)
                            ? context.read<RunTrackCubit>().onStopTracking()
                            : context.read<RunTrackCubit>().onStartTracking(),
                        child: Text(
                          (state.runTrackingStatus ==
                                  RunTrackingStatus.tracking)
                              ? "Stop"
                              : "Start",
                          style: AppStyles.f18m().copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () =>
                      //       context.read<RunTrackCubit>().onStopTracking(),
                      //   child: Text(
                      //     "Stop",
                      //     style: AppStyles.f16m().copyWith(
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
