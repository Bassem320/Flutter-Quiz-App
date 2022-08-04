import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback restartQuiz;

  const Result(this.totalScore, this.restartQuiz);

  get resultPhrase {
    String resultText;
    if (totalScore > 20) {
      resultText = 'You Are Awesome';
    } else {
      resultText = 'That was bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: restartQuiz,
            child: const Text(
              'Restart Quiz',
            ),
          )
        ],
      ),
    );
  }
}
