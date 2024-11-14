import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:health_app_flutter/util/service/heart_bpm_service.dart';

/// Generate a simple heart BPM graph
class BPMChart extends StatelessWidget {
  /// Data series formatted to be plotted
  final List<SensorValue> data;
  final List<SensorValue>? data2;

  /// Generate the heart BPM graph from a given list of [data] of type
  /// [SensorValue]
  const BPMChart(
    this.data, {
    super.key,
    this.data2,
  });

  @override
  Widget build(BuildContext context) {
    num minY = data.map((e) => e.value).reduce((a, b) => a < b ? a : b);
    num maxY = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    List<FlSpot> createSpots(List<SensorValue> sensorData) {
      return sensorData
          .map((e) => FlSpot(
                e.time.millisecondsSinceEpoch.toDouble(),
                e.value.toDouble(),
              ))
          .toList();
    }

    return LineChart(
      LineChartData(
        minY: minY.floorToDouble(),
        maxY: maxY.floorToDouble(),
        lineBarsData: [
          LineChartBarData(
            spots: createSpots(data),
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
          ),
          if (data2 != null)
            LineChartBarData(
              spots: createSpots(data2!),
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
            ),
        ],
        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Text(
                  '${date.hour}:${date.minute}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                );
              },
              reservedSize: 30,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
