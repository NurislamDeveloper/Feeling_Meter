import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of mood scores (replace with actual data)
    final List<int> moodScores = [75, 80, 65, 90, 88];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Mood Scores Over Time:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: moodScores.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mood Score: ${moodScores[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
