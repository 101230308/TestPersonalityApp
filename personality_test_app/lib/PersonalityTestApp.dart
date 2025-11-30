import 'package:flutter/material.dart';
import 'package:personality_test_app/data/questions.dart';
import 'package:personality_test_app/screens/questions_screens.dart';
import 'package:personality_test_app/screens/results_screen.dart';
import 'package:personality_test_app/screens/start_screen.dart';

class Personalitytestapp extends StatefulWidget {
  const Personalitytestapp({super.key});

  @override
  State<Personalitytestapp> createState() => _PersonalitytestappState();
}

class _PersonalitytestappState extends State<Personalitytestapp> {
  String activeScreenName = 'start-screen';
  List<int> chosenAnswers = [];
  int currentQuestionIndex = 0;
  void startTest() {
    setState(() {
      activeScreenName = 'questions-screen';
    });
  }

  void chooseAnswer(int answerIndex) {
    chosenAnswers.add(answerIndex);
    if (currentQuestionIndex + 1 < questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        activeScreenName = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreenName = 'start-screen';
      chosenAnswers = [];
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(startTest);
    if (activeScreenName == 'questions-screen') {
      activeScreen = QuestionsScreens(
        chooseAnswer,
        questions[currentQuestionIndex],
      );
    }
    if (activeScreenName == 'results-screen') {
      activeScreen = ResultsScreen(
        chosenAnswers: chosenAnswers,
        restart: restartQuiz,
      );
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 112, 118, 156),
              const Color.fromARGB(255, 41, 128, 191),
              const Color.fromARGB(199, 255, 255, 255),
            ],
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
