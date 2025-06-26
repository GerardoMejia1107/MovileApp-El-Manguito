import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sales = 100.00;
    final String month = "July";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Ventas",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Hoy"),
                            content: Padding(
                              padding: EdgeInsets.only(
                                left: 0.0,
                                right: 0.0,
                                bottom: 10,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    color: Color.fromARGB(255, 9, 158, 55),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Ventas de hoy: ${sales}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: LineChart(
                                      LineChartData(
                                        titlesData: FlTitlesData(
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  'Día ${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  '${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(show: true),
                                        borderData: FlBorderData(show: true),
                                        lineBarsData: [
                                          LineChartBarData(
                                            isCurved: true,
                                            color: Colors.orange,
                                            barWidth: 3,
                                            spots: [
                                              FlSpot(1, 3),
                                              FlSpot(2, 5),
                                              FlSpot(3, 4),
                                              FlSpot(4, 7),
                                              FlSpot(5, 6),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 100,
                      width: screenWidth / 2.5,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fastfood,
                              size: 40,
                              color: Color.fromARGB(232, 243, 86, 50),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ventas de hoy: ${sales}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Ventas"),
                            content: Padding(
                              padding: EdgeInsets.only(
                                left: 0.0,
                                right: 0.0,
                                bottom: 10,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    color: Color.fromARGB(255, 9, 158, 55),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Ventas del mes: ${sales * 10}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: LineChart(
                                      LineChartData(
                                        titlesData: FlTitlesData(
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  'Día ${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  '${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(show: true),
                                        borderData: FlBorderData(show: true),
                                        lineBarsData: [
                                          LineChartBarData(
                                            isCurved: true,
                                            color: Colors.green,
                                            barWidth: 3,
                                            spots: [
                                              FlSpot(1, 3),
                                              FlSpot(2, 5),
                                              FlSpot(3, 4),
                                              FlSpot(4, 7),
                                              FlSpot(5, 6),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: screenWidth / 2.5,
                      height: 100,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.food_bank,
                              size: 40,
                              color: Color.fromARGB(155, 42, 223, 26),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ventas del mes: ${sales * 10}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mes pasado: ${month}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Ventas (Prom.) ${month}"),
                            content: Padding(
                              padding: EdgeInsets.only(
                                left: 0.0,
                                right: 0.0,
                                bottom: 10,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    color: Color.fromARGB(255, 9, 158, 55),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Ventas: ${sales}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: LineChart(
                                      LineChartData(
                                        titlesData: FlTitlesData(
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  'Día ${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  '${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(show: true),
                                        borderData: FlBorderData(show: true),
                                        lineBarsData: [
                                          LineChartBarData(
                                            isCurved: true,
                                            color: Colors.orange,
                                            barWidth: 3,
                                            spots: [
                                              FlSpot(1, 3),
                                              FlSpot(2, 5),
                                              FlSpot(3, 4),
                                              FlSpot(4, 7),
                                              FlSpot(5, 6),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 100,
                      width: screenWidth / 2.5,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.fastfood,
                              size: 40,
                              color: Color.fromARGB(232, 243, 86, 50),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ventas/día (prom.): ${sales}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Ventas ${month}"),
                            content: Padding(
                              padding: EdgeInsets.only(
                                left: 0.0,
                                right: 0.0,
                                bottom: 10,
                                top: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    color: Color.fromARGB(255, 9, 158, 55),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Ventas del mes: ${sales * 10}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: LineChart(
                                      LineChartData(
                                        titlesData: FlTitlesData(
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  'Día ${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  '${value.toInt()}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(show: true),
                                        borderData: FlBorderData(show: true),
                                        lineBarsData: [
                                          LineChartBarData(
                                            isCurved: true,
                                            color: Colors.green,
                                            barWidth: 3,
                                            spots: [
                                              FlSpot(1, 3),
                                              FlSpot(2, 5),
                                              FlSpot(3, 4),
                                              FlSpot(4, 7),
                                              FlSpot(5, 6),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cerrar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: screenWidth / 2.5,
                      height: 100,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.food_bank,
                              size: 40,
                              color: Color.fromARGB(155, 42, 223, 26),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Ventas del mes: ${sales * 10}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Platos más vendidos este mes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: SizedBox(
                    height: 300,
                    width: 250,
                    child: BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(toY: 5, color: Colors.teal),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(toY: 7, color: Colors.green),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: Colors.greenAccent,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(toY: 7, color: Colors.cyan),
                            ],
                          ),
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final labels = [
                                  'Risotto',
                                  'Max Burger',
                                  'Tacos',
                                  'Caesar salad',
                                ];
                                final idx = value.toInt();
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    idx >= 0 && idx < labels.length
                                        ? labels[idx]
                                        : '',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    value.toInt().toString(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                );
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                        gridData: FlGridData(show: true),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
