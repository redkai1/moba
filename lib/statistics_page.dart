import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final Random random = Random();
  String selectedPeriod = 'Día';

  List<BarChartGroupData> generateRandomData(int numberOfBars) {
    return List.generate(numberOfBars, (index) {
      double randomValue = random.nextInt(100).toDouble();
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: randomValue, width: 15, color: Colors.blue),
        ],
      );
    });
  }

  List<FlSpot> generateRandomSpots(int numberOfSpots) {
    return List.generate(numberOfSpots, (index) {
      return FlSpot(index.toDouble(), random.nextDouble() * 100);
    });
  }

  int getNumberOfBars() {
    switch (selectedPeriod) {
      case 'Día':
        return 7;
      case 'Semana':
        return 4;
      case 'Mes':
        return 12;
      default:
        return 7;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> obstaclesData = generateRandomData(getNumberOfBars());
    final List<BarChartGroupData> humidityData = generateRandomData(getNumberOfBars());
    final List<FlSpot> mobilityData = generateRandomSpots(getNumberOfBars());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estadísticas',
          style: TextStyle(fontFamily: 'JosefinSans'), // Aplicar la fuente
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedPeriod,
              items: ['Día', 'Semana', 'Mes'].map((String period) {
                return DropdownMenuItem<String>(
                  value: period,
                  child: Text(
                    'Último $period',
                    style: TextStyle(fontFamily: 'JosefinSans'), // Aplicar la fuente
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPeriod = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Detección de Obstáculos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans'), // Aplicar la fuente
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(), style: TextStyle(fontFamily: 'JosefinSans')); // Aplicar la fuente
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text('${selectedPeriod.substring(0, 1)} ${value.toInt()}', style: TextStyle(fontFamily: 'JosefinSans')); // Aplicar la fuente
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.black, width: 1)),
                  barGroups: obstaclesData,
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Detección de Humedad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans'), // Aplicar la fuente
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(), style: TextStyle(fontFamily: 'JosefinSans')); // Aplicar la fuente
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text('${selectedPeriod.substring(0, 1)} ${value.toInt()}', style: TextStyle(fontFamily: 'JosefinSans')); // Aplicar la fuente
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.black, width: 1)),
                  barGroups: humidityData,
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Índice de Mejora en la Movilidad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans'), // Aplicar la fuente
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(), style: TextStyle(fontFamily: 'JosefinSans')); // Aplicar la fuente
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text('${selectedPeriod.substring(0, 1)} ${value.toInt()}', style: TextStyle(fontFamily: 'JosefinSans')); // Aplicar la fuente
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true, border: Border.all(color: Colors.black, width: 1)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: mobilityData,
                      isCurved: true,
                      color: Colors.teal,
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [Colors.teal.withOpacity(0.3), Colors.teal.withOpacity(0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}