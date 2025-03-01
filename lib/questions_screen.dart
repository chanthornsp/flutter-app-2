import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app2/answer_button.dart';
import 'package:my_app2/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onAnswerSelected});

  final void Function(String) onAnswerSelected;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onAnswerSelected(answer);
    setState(() {
      if (currentQuestionIndex == questions.length - 1) {
        // will show the result screen
        return;
      }
      currentQuestionIndex++;
    });
  }

  void preQuestion() {
    setState(() {
      if (currentQuestionIndex == 0) return;
      currentQuestionIndex--;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex == questions.length - 1) return;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.notoSansKhmer(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    preQuestion();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                TextButton(
                  onPressed: () {
                    nextQuestion();
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
