import 'package:flutter/material.dart';
import 'package:health_app_flutter/feature/heart_bpm/widget/bpm_chart.dart';
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

    return maxValue.toDouble() - minValue.toDouble() < 10 ? data : null;
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
    List<SensorValue>? stableValues = getStableValues(bpmValues);
    if (stableValues != null) {
      debugPrint('BPM is stable average: ${calculateAverage(stableValues)}');
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Heart BPM',
          style: AppStyles.f20sb(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
                      if (bpmValues.length >= 100) bpmValues.removeAt(0);
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
            isBPMEnabled && bpmValues.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(border: Border.all()),
                    constraints: const BoxConstraints.expand(height: 180),
                    child: BPMChart(bpmValues),
                  )
                : const SizedBox(),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.favorite_rounded),
                label: Text(isBPMEnabled ? "Stop measurement" : "Measure BPM"),
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
  }
}
