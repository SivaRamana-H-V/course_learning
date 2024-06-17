import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart'; // Import for fl_chart

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, int> usageData = {};

  @override
  void initState() {
    super.initState();
    _loadUsageData();
  }

  Future<void> _loadUsageData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final data = <String, int>{};

    for (var key in keys) {
      if (RegExp(r'\d{4}-\d{2}-\d{2}').hasMatch(key)) {
        data[key] = prefs.getInt(key) ?? 0;
      }
    }

    setState(() {
      usageData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PieChart(
                  PieChartData(
                    sections: _generateSections(),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: usageData.length,
                itemBuilder: (context, index) {
                  final key = usageData.keys.elementAt(index);
                  final count = usageData[key]!;
                  return ListTile(
                    title: Text('$key: $count times'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _generateSections() {
    return usageData.keys.map((key) {
      final value = usageData[key]!;
      return PieChartSectionData(
        color: _randomColor(),
        value: value.toDouble(),
        title: '$key\n$value times',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      );
    }).toList();
  }

  Color _randomColor() {
    return Color((1 << 24) | (DateTime.now().millisecondsSinceEpoch & 0xFFFFFF));
  }
}
