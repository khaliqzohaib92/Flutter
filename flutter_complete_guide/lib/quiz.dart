import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.answerQuestion,
      @required this.questionIndex,
      @required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) =>
                Answer(() => answerQuestion(answer['score']), answer['text'])),
      ],
    );
  }
}
