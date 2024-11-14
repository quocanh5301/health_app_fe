import 'package:flutter/material.dart';
import 'package:health_app_flutter/feature/heart_bpm/widget/bpm_chart.dart';
import 'package:health_app_flutter/util/service/heart_bpm_service.dart';

class HeartBPMScreen extends StatefulWidget {
  const HeartBPMScreen({super.key});

  @override
  State<HeartBPMScreen> createState() => _HeartBPMScreenState();
}

class _HeartBPMScreenState extends State<HeartBPMScreen> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];
  //  Widget chart = BPMChart(data);

  bool isBPMEnabled = false;
  Widget? dialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Heart BPM Demo'),
      ),
      body: Column(
        children: [
          isBPMEnabled
              ? dialog = HeartBPMDialog(
                  context: context,
                  showTextValues: true,
                  borderRadius: 10,
                  onRawData: (value) {
                    setState(() {
                      if (data.length >= 100) data.removeAt(0);
                      data.add(value);
                    });
                    // chart = BPMChart(data);
                  },
                  onBPM: (value) => setState(() {
                    if (bpmValues.length >= 100) bpmValues.removeAt(0);
                    bpmValues.add(SensorValue(
                        value: value.toDouble(), time: DateTime.now()));
                  }),
                  // sampleDelay: 1000 ~/ 20,
                  // child: Container(
                  //   height: 50,
                  //   width: 100,
                  //   child: BPMChart(data),
                  // ),
                )
              : const SizedBox(),
          isBPMEnabled && data.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 180,
                  child: BPMChart(data),
                )
              : const SizedBox(),
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
              onPressed: () => setState(() {
                isBPMEnabled = !isBPMEnabled;
                if (!isBPMEnabled) {
                  data.clear();
                  bpmValues.clear();
                }
              },),
            ),
          ),
        ],
      ),
    );
  }
}