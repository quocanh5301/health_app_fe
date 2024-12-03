import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app_flutter/feature/heart_bpm/bloc/bpm_cubit.dart';
import 'package:health_app_flutter/feature/heart_bpm/bloc/bpm_state.dart';
import 'package:health_app_flutter/feature/heart_bpm/widget/bpm_chart.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/common_widget/overlay/my_overlay_controller.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/service/heart_bpm_service.dart';
import 'package:health_app_flutter/util/styles.dart';

class HeartBPMScreen extends StatefulWidget {
  const HeartBPMScreen({super.key});

  @override
  State<HeartBPMScreen> createState() => _HeartBPMScreenState();
}

class _HeartBPMScreenState extends State<HeartBPMScreen> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];

  bool isBPMEnabled = false;

  List<SensorValue>? getStableValues(List<SensorValue> data) {
    if (data.isEmpty) {
      return null;
    }

    final maxValue = data.reduce((a, b) => a.value > b.value ? a : b).value;
    final minValue = data.reduce((a, b) => a.value < b.value ? a : b).value;

    return maxValue.toDouble() - minValue.toDouble() < 13 ? data : null;
  }

  /// Calculate the average of the 'value' field in a list of SensorValue objects.
  double calculateAverage(List<SensorValue> sensorValues) {
    if (sensorValues.isEmpty) {
      return 0.0;
    }
    // Calculate the sum of all 'value' fields
    num sum = sensorValues.fold(0, (total, element) => total + element.value);
    // Calculate and return the average
    return sum / sensorValues.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Heart BPM',
          style: AppStyles.f20sb(),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<BPMCubit>(),
        child: BlocConsumer<BPMCubit, BPMState>(
          listenWhen: (previous, current) =>
              previous.setYouBPMStatus != current.setYouBPMStatus,
          listener: (context, state) {
            if (state.setYouBPMStatus == SetYouBPMStatus.success) {
              bool mearsureAgain = false;
              MyOverlayController.showMyDialog(
                context,
                "This is you BPM mearsurement",
                "BPM: ${state.bpm}\n${state.stressDescription}",
                () {
                  context.pop();
                },
                () {
                  mearsureAgain = true;
                  context.pop();
                },
                (_) {
                  if (mearsureAgain) {
                    setState(() {
                      isBPMEnabled = true;
                    });
                  } else {
                    context.pop();
                  }
                },
                S.of(context).confirm,
                "Measure again",
              );
            } else if (state.setYouBPMStatus == SetYouBPMStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.mess),
                  backgroundColor: Colors.red,
                ),
              );
              isBPMEnabled = true;
            }
          },
          buildWhen: (previous, current) =>
              previous.setYouBPMStatus != current.setYouBPMStatus,
          builder: (context, state) {
            List<SensorValue>? stableValues = getStableValues(bpmValues);
            if (stableValues != null && stableValues.length >= 100) {
              final bpm = calculateAverage(stableValues);
              debugPrint('BPM is stable average: $bpm');

              isBPMEnabled = false;
              context.read<BPMCubit>().setBPM(bpm.toInt());
              context.read<BPMCubit>().saveBPMData();
              stableValues.clear();
              stableValues = null;
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    isBPMEnabled
                        ? HeartBPMDialog(
                            context: context,
                            showTextValues: true,
                            borderRadius: 10,
                            onRawData: (value) {
                              setState(() {
                                if (data.length >= 100) data.removeAt(0);
                                data.add(value);
                              });
                            },
                            onBPM: (value) => setState(() {
                              if (bpmValues.length >= 100) {
                                bpmValues.removeAt(0);
                              }
                              bpmValues.add(
                                SensorValue(
                                  value: value.toDouble(),
                                  time: DateTime.now(),
                                ),
                              );
                            }),
                          )
                        : const SizedBox(),
                    const VerticalSpace(15),
                    Text(
                      "Put your finger to cover the camera AND the flash light at the same time to ensure your BPM is measured accurately.",
                      style: AppStyles.f16m(),
                    ),
                    const VerticalSpace(15),
                    isBPMEnabled && data.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(border: Border.all()),
                            constraints:
                                const BoxConstraints.expand(height: 180),
                            child: BPMChart(data),
                          )
                        : const SizedBox(),
                    const VerticalSpace(15),
                    isBPMEnabled && bpmValues.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(border: Border.all()),
                            constraints:
                                const BoxConstraints.expand(height: 180),
                            child: BPMChart(bpmValues),
                          )
                        : const SizedBox(),
                    const VerticalSpace(10),
                    Center(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.favorite_rounded),
                        label: Text(
                            isBPMEnabled ? "Stop measurement" : "Measure BPM"),
                        onPressed: () => setState(
                          () {
                            isBPMEnabled = !isBPMEnabled;
                            if (!isBPMEnabled) {
                              data.clear();
                              bpmValues.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
