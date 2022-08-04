import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = [
    {
      'question': 'What\'s your favourite animal?',
      'answers': [
        {'text':'Rabbit','score':3},
        {'text':'Bat','score':5},
        {'text':'Lion','score':7},
        {'text':'Elephant','score':4},
      ],
    },
    {
      'question': 'What\'s your favourite colour?',
      'answers': [
        {'text':'Orange','score':7},
        {'text':'Blue','score':6},
        {'text':'Black','score':4},
        {'text':'White','score':3},
      ],
    },
    {
      'question': 'Who\'s your favourite instructor?',
      'answers': [
        {'text':'Bassem','score':10},
        {'text':'Bassem','score':10},
        {'text':'Bassem','score':10},
        {'text':'Bassem','score':10},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _restartQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
          questions: _questions,
          questionIndex: _questionIndex,
          answerQuestion: _answerQuestion,
        )
            : Result(_totalScore,_restartQuiz),
      ),
    );
  }
}
