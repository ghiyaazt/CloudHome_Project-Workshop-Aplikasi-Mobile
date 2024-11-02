import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class suhudankelembaban extends StatelessWidget {
  const suhudankelembaban({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo1 1.png', height: 24),
            const SizedBox(width: 8),
            const Text(
              'CloudHome',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.blue[300]!,
            ],
          ),
        ),
        child: Column(
          children: [
            // Weather Chart
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      // Temperature line
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 20),
                          const FlSpot(1, 22),
                          const FlSpot(2, 25),
                          const FlSpot(3, 24),
                          const FlSpot(4, 21),
                        ],
                        isCurved: true,
                        color: Colors.red,
                        dotData: FlDotData(show: true),
                      ),
                      // Humidity line
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 18),
                          const FlSpot(1, 20),
                          const FlSpot(2, 22),
                          const FlSpot(3, 21),
                          const FlSpot(4, 19),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        dotData: FlDotData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Temperature Indicator
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.thermostat, color: Colors.orange[700]),
                  const SizedBox(width: 8),
                  const Text(
                    '19°C',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Humidity Indicator
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.water_drop, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text(
                    '22%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Navigation with Local Icons
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/iot 1.png', height: 24),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    icon: Image.asset('assets/images/home (3) 1.png', height: 24),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    icon: Image.asset('assets/images/snowing 2.png', height: 24),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
