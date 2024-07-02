import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function queindexanswer;
  final int queindex;
  Quiz(
      {required this.questions,
      required this.queindexanswer,
      required this.queindex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[queindex]['questiontxt'] as String),
        ...(questions[queindex]['answertxt'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => queindexanswer(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
