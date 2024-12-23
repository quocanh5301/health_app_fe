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
        backgroundColor: "#1f2933".toColor(),
        appBar: AppBar(
          backgroundColor: Colors.grey.withOpacity(0.3),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Fitness Tracker",
            style: AppStyles.f18m().copyWith(color: Colors.white),
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
                    SnackBar(
                      content: Text(
                        "Please enable location and activity tracking from your device settings",
                        style: AppStyles.f16m().copyWith(color: Colors.white),
                      ),
                    ),
                  )
                  .closed
                  .then((value) => const BaseRoute().push(context));
            }
          },
          buildWhen: (previous, current) =>
              previous.runTrackingStatus != current.runTrackingStatus ||
              previous.saveRunStatus != current.saveRunStatus 
              ||
              // current.runData.distanceTraveled != previous.runData.distanceTraveled || 
              // current.runData.stepsCount != previous.runData.stepsCount ||
              current.runData.timePassed != previous.runData.timePassed,
          builder: (context, state) {
            return Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Distance Traveled: ${state.runData.distanceTraveled} meters",
                        style: AppStyles.f16m().copyWith(color: Colors.white),
                      ),
                      const VerticalSpace(15),
                      Text(
                        "Step Count: ${state.runData.stepsCount.toStringAsFixed(2)}",
                        style: AppStyles.f16m().copyWith(color: Colors.white),
                      ),
                      const VerticalSpace(15),
                      Text(
                        "Time Passed: ${state.runData.timePassed.inSeconds} seconds",
                        style: AppStyles.f16m().copyWith(color: Colors.white),
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
