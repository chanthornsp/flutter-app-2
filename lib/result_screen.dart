import 'package:flutter/material.dart';
import 'package:my_app2/data/questions.dart';
import 'package:my_app2/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.results,
    required this.onRestart,
  });

  final List<String> results;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < results.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'answer': results[i],
        // if the answer is correct is the first index of the list
        'is_correct': questions[i].answers[0] == results[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers =
        summaryData.where((item) => item['is_correct'] as bool).length;
    final totalQuestions = questions.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You got $correctAnswers out of $totalQuestions correct!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),

            QuestionSummary(summaryData: summaryData),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  onRestart();
                },
                child: Text('Restart Quiz'),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
