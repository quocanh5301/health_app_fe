import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/home/bloc/home_cubit.dart';
import 'package:health_app_flutter/feature/home/bloc/home_state.dart';

class MyRunGraph extends StatelessWidget {
  const MyRunGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.thisWeekRunDatas != current.thisWeekRunDatas ||
          previous.lastWeekRunDatas != current.lastWeekRunDatas ||
          previous.getYourDataStatus != current.getYourDataStatus,
      builder: (context, state) {
        // Parse the run data into points for the graph
        final currentWeekPoints = state.thisWeekRunDatas
            .asMap()
            .entries
            .map((entry) => FlSpot(
                  entry.key.toDouble(),
                  double.tryParse(entry.value.distance ?? "0") ?? 0,
                ))
            .toList();

        final previousWeekPoints = state.lastWeekRunDatas
            .asMap()
            .entries
            .map((entry) => FlSpot(
                  entry.key.toDouble(),
                  double.tryParse(entry.value.distance ?? "0") ?? 0,
                ))
            .toList();

        // Combine all points to find the min and max Y
        final allPoints = [...currentWeekPoints, ...previousWeekPoints];
        final maxY = allPoints.isNotEmpty
            ? allPoints.map((point) => point.y).reduce((a, b) => a > b ? a : b)
            : 10; // Default max if no data
        final minY = allPoints.isNotEmpty
            ? allPoints.map((point) => point.y).reduce((a, b) => a < b ? a : b)
            : 0; // Default min if no data

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: const EdgeInsets.all(10.0),
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      return Text(
                        'Day ${value.toInt() + 1}', // +1 to display days starting from 1
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) => Text(
                      '${value.toStringAsFixed(1)} km', // Display distance
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.black, width: 1),
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              minX: 0,
              maxX: 6, // 7 days of the week
              minY: minY.toDouble(), // Dynamically calculated minY
              maxY: maxY.toDouble(), // Dynamically calculated maxY
              lineBarsData: [
                LineChartBarData(
                  spots: currentWeekPoints,
                  isCurved: true,
                  color: Colors.blue,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                      show: true, color: Colors.blue.withOpacity(0.1)),
                  barWidth: 4,
                ),
                LineChartBarData(
                  spots: previousWeekPoints,
                  isCurved: true,
                  color: Colors.red,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                      show: true, color: Colors.red.withOpacity(0.1)),
                  barWidth: 4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
