import 'package:flutter/material.dart';
import 'package:personality_test_app/models/personality.dart';

class ResultsScreen extends StatelessWidget {
  final void Function() restart;
  final List<int> chosenAnswers;
  const ResultsScreen({
    required this.chosenAnswers,
    required this.restart,
    super.key,
  });
  Personality getResult() {
    List<int> scores = [0, 0, 0, 0];
    for (int i = 0; i < chosenAnswers.length; i++) {
      int index = chosenAnswers[i];
      scores[index]++;
    }
    int highestScore = 0;
    for (int i = 0; i < scores.length; i++) {
      if (scores[i] > scores[highestScore]) {
        highestScore = i;
      }
    }
    return Personality.values[highestScore];
  }

  @override
  Widget build(BuildContext context) {
    final Personality = getResult();
    final resultMessage = personalityMessages[Personality]!;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(resultMessage),
              SizedBox(height: 45),
              ElevatedButton(onPressed: restart, child: Text('Restart Test')),
            ],
          ),
        ),
      ),
    );
  }
}
