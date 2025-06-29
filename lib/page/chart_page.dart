import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grafik Data")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Grafik Garis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200, child: LineChart(mainLineData())),
            SizedBox(height: 20),
            Text(
              "Grafik Batang",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200, child: BarChart(mainBarData())),
          ],
        ),
      ),
    );
  }

  // Grafik Garis
  LineChartData mainLineData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 3.1),
            FlSpot(4, 4),
            FlSpot(5, 3),
            FlSpot(6, 4),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

  // Grafik Batang
  BarChartData mainBarData() {
    return BarChartData(
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, _) => Text("Hari ${value.toInt() + 1}"),
            reservedSize: 28,
          ),
        ),
      ),
      barGroups: [
        makeGroupData(0, 5),
        makeGroupData(1, 6),
        makeGroupData(2, 3),
        makeGroupData(3, 7),
        makeGroupData(4, 4),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [BarChartRodData(toY: y, color: Colors.orange, width: 16)],
    );
  }
}
