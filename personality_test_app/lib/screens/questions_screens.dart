import 'package:flutter/material.dart';
import 'package:personality_test_app/data/questions.dart';
import 'package:personality_test_app/models/test_question.dart';

class QuestionsScreens extends StatelessWidget {
  final void Function(int answer) onSelectAnswer;
  final TestQuestion question;
  const QuestionsScreens(this.onSelectAnswer, this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    final shuffledAnswers = question.getShuffledAnswers();
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.text,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          ...shuffledAnswers.map((answer) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                final index = question.answers.indexOf(answer);
                onSelectAnswer(index);
              },
              child: Text(answer),
            );
          }),
        ],
      ),
    );
  }
}
