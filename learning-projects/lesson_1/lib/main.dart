import 'package:flutter/material.dart';
import 'package:lesson_1/result.dart';
import './quiz.dart';

void main() {
  runApp(Firstlesson());
}

class Firstlesson extends StatefulWidget {
  @override
  State<Firstlesson> createState() {
    return _FirstlessonState();
  }
}

class _FirstlessonState extends State<Firstlesson> {
  var _queindex = 0;
  var _totalsocre = 0;
  void restQuiz() {
    setState(() {
      _queindex = 0;
      _totalsocre = 0;
    });
  }

  void _queindexanswer(int score) {
    _totalsocre += score;
    setState(() {
      _queindex = _queindex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questiontxt': 'who are u',
        'answertxt': [
          {'text': 'no one', 'score': 4},
          {'text': 'whon knows', 'score': 23},
          {'text': 'y tell me', 'score': 1},
        ],
      },
      {
        'questiontxt': 'what are u doin',
        'answertxt': [
          {'text': 'dont know', 'score': 3},
          {'text': 'why', 'score': 2},
          {'text': 'like u care', 'score': 15},
        ],
      },
      {
        'questiontxt': 'what\'s app',
        'answertxt': [
          {'text': 'noting match', 'score': 12},
          {'text': 'not good', 'score': 1},
          {'text': 'cooooool', 'score': 55},
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Myfirst lesson app -_-'),
            backgroundColor: Colors.red,
          ),
          body: _queindex < _questions.length
              ? Quiz(
                  queindexanswer: _queindexanswer,
                  questions: _questions,
                  queindex: _queindex)
              : Result(_totalsocre, restQuiz)),
    );
  }
}
