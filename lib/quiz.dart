import 'package:flutter/material.dart';
import 'package:my_app2/data/questions.dart';
import 'package:my_app2/home_screen.dart';
import 'package:my_app2/questions_screen.dart';
import 'package:my_app2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'home';

  // @override
  //   void initState() {
  //     // activeScreen = Home(changeScreen);
  //     super.initState();
  //   }

  void changeScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  @override
  Widget build(context) {
    void onRestart() {
      setState(() {
        activeScreen = 'questions';
        selectedAnswers = [];
      });
    }

    Widget screen = Home(changeScreen);
    if (activeScreen == 'questions') {
      screen = QuestionsScreen(onAnswerSelected: chooseAnswer);
    } else if (activeScreen == 'result') {
      screen = ResultScreen(results: selectedAnswers, onRestart: onRestart);
      // reset the selected answers
      // selectedAnswers = [];
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz'), backgroundColor: Colors.purple),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 65, 14, 67),
                Color.fromARGB(255, 44, 2, 42),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
