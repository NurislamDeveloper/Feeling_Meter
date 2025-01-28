
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final Map<String, dynamic> results;

  const ResultsPage({super.key, required this.results});

  String getStressLevelDescription(double level) {
    if (level < 30) {
      return 'Low Stress';
    } else if (level < 70) {
      return 'Moderate Stress';
    } else {
      return 'High Stress';
    }
  }

  String getSelfEsteemDescription(double level) {
    if (level < 30) {
      return 'Low Self-Esteem';
    } else if (level < 70) {
      return 'Average Self-Esteem';
    } else {
      return 'High Self-Esteem';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mood: ${results['mood']}"),
            const SizedBox(height: 10),
            Text("Stress Level: ${results['stressLevel']}"),
            Text("Description: ${getStressLevelDescription(results['stressLevel'])}"),
            const SizedBox(height: 10),
            Text("Self-Esteem: ${results['selfEsteem']}"),
            Text("Description: ${getSelfEsteemDescription(results['selfEsteem'])}"),
            const SizedBox(height: 10),
            Text("Notes: ${results['notes'] ?? 'No notes provided'}"),
          ],
        ),
      ),
    );
  }
}
